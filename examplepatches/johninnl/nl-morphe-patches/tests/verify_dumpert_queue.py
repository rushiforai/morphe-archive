"""Execute emitted CCT filtering and original restart/response/delete contracts."""

CCT = 'Lcom/google/android/datatransport/cct/CctTransportBackend;'
REQUEST = 'Lcom/google/android/datatransport/runtime/backends/BackendRequest;'
RESPONSE = 'Lcom/google/android/datatransport/runtime/backends/BackendResponse;'
RUNTIME = 'Lcom/google/android/datatransport/runtime/'
UPLOADER = RUNTIME + 'scheduling/jobscheduling/Uploader;'
STORE = RUNTIME + 'scheduling/persistence/SQLiteEventStore;'
WORK = RUNTIME + 'scheduling/jobscheduling/WorkInitializer;'
HELPER = 'morpheMeasurementBatch(' + REQUEST + ')' + REQUEST
MEASUREMENT = {'FIREBASE_CRASHLYTICS_REPORT', 'FIREBASE_APPQUALITY_SESSION',
               'FCM_CLIENT_EVENT_LOGGING', 'GDT_CLIENT_METRICS'}


def verify_queue(source, canonical, execute):
    def code(owner, signature):
        return canonical(source.body(owner, signature))

    def invoke(owner, signature, args, callback):
        return execute(code(owner, signature), {'p' + str(i): x for i, x in enumerate(args)}, callback)

    def common(target, args):
        if target.endswith('->iterator()Ljava/util/Iterator;'):
            return {'iterator': iter(args[0]), 'pending': []}
        if target.endswith('->hasNext()Z'):
            iterator = args[0]
            if not iterator['pending']:
                try:
                    iterator['pending'].append(next(iterator['iterator']))
                except StopIteration:
                    return 0
            return 1
        if target.endswith('->next()Ljava/lang/Object;'):
            return args[0]['pending'].pop(0)
        if target == 'Ljava/lang/String;->equals(Ljava/lang/Object;)Z':
            return int(args[0] == args[1])
        if target == 'Ljava/util/ArrayList;-><init>()V':
            return None
        if target == 'Ljava/util/ArrayList;->isEmpty()Z':
            return int(len(args[0]) == 0)
        if target == 'Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z':
            args[0].append(args[1])
            return 1
        if target.startswith(REQUEST + '->'):
            if '->getEvents(' in target:
                return args[0]['events']
            if '->getExtras(' in target:
                return args[0]['extras']
            if '->builder(' in target:
                return {'builder': 1}
        builder = REQUEST[:-1] + '$Builder;->'
        if target.startswith(builder):
            if '->setEvents(' in target:
                args[0]['events'] = args[1]
                return args[0]
            if '->setExtras(' in target:
                args[0]['extras'] = args[1]
                return args[0]
            if '->build(' in target:
                return {'events': args[0]['events'], 'extras': args[0]['extras']}
        if target == RUNTIME + 'EventInternal;->getTransportName()Ljava/lang/String;':
            return args[0]['transport']
        raise AssertionError('Unexpected queue-filter call: ' + target)

    # One-shot iterables, precise-name boundaries and repeated/equal records.
    # The helper must return original objects, not values reconstructed by tests.
    fixtures = [[], [{'transport': name} for name in sorted(MEASUREMENT)],
                [{'transport': 'CAST_SENDER_SDK'}, {'transport': 'PLAY_BILLING_LIBRARY'},
                 {'transport': ''}, {'transport': 'FIREBASE_APPQUALITY_SESSION_suffix'}],
                [{'transport': 'unknown'}, {'transport': 'FCM_CLIENT_EVENT_LOGGING'},
                 {'transport': 'unknown'}, {'transport': 'GDT_CLIENT_METRICS'}]]
    for events in fixtures:
        expected = [event for event in events if event['transport'] not in MEASUREMENT]
        for extras in (0, b'', b'fixture-extra'):
            for one_shot in (False, True):
                request = {'events': iter(events) if one_shot else events, 'extras': extras}
                output = invoke(CCT, HELPER, [request], common)
                if not expected:
                    assert output == 0, 'Suppress empty/all-measurement batches'
                else:
                    assert output['extras'] is extras, 'Retain the exact original request extras'
                    assert len(output['events']) == len(expected)
                    assert all(a is b for a, b in zip(output['events'], expected)), 'Retain event identity and order, including repeated values'

    send_signature = 'send(' + REQUEST + ')' + RESPONSE
    factory_names = {'ok', 'fatalError', 'transientError', 'invalidPayload'}
    response_status = RESPONSE[:-1] + '$Status;->'
    def factory(name, args, callback):
        signature = name + ('(J)' if name == 'ok' else '()') + RESPONSE
        return invoke(RESPONSE, signature, args, callback)

    def sender(events, http_status):
        requests = []
        state = {'endPoint': {'fixture': 'endpoint'}}
        request = {'events': events, 'extras': 0}
        def backend_call(target, args):
            if target == CCT + '->' + HELPER:
                return invoke(CCT, HELPER, args, backend_call)
            if target.startswith(RESPONSE + '->'):
                name = target.split('->')[1].split('(')[0]
                assert name in factory_names
                return factory(name, args, backend_call)
            if 'AutoValue_BackendResponse;-><init>(' in target:
                args[0].update(status=args[1], wait=args[2])
                return None
            if target == CCT + '->getRequestBody(' + REQUEST + ')Lcom/google/android/datatransport/cct/internal/BatchedLogRequest;':
                requests.append(args[1])
                return {'batch': args[1]}
            if 'CctTransportBackend$HttpRequest;-><init>(' in target:
                args[0].update(endpoint=args[1], body=args[2], key=args[3])
                return None
            if 'CctTransportBackend$$ExternalSyntheticLambda' in target and '-><init>(' in target:
                return None
            if target.startswith(RUNTIME + 'retries/Retries;->retry('):
                return {'code': http_status, 'nextRequestMillis': 37}
            return common(target, args)
        response = invoke(CCT, send_signature, [state, request], backend_call)
        return response, requests

    for names in [sorted(MEASUREMENT), ['unknown'], ['unknown', *sorted(MEASUREMENT), 'CAST_SENDER_SDK', 'PLAY_BILLING_LIBRARY']]:
        events = [{'transport': name, 'id': i} for i, name in enumerate(names)]
        retained = [event for event in events if event['transport'] not in MEASUREMENT]
        for status, expected in [(200, 'OK'), (403, 'FATAL_ERROR'), (500, 'TRANSIENT_ERROR'), (400, 'INVALID_PAYLOAD')]:
            response, requests = sender(events, status)
            expected = expected if retained else 'FATAL_ERROR'
            assert response['status'] == response_status + expected + ':' + RESPONSE[:-1] + '$Status;', 'Use genuine native backend status'
            assert response['wait'] == (37 if retained and status == 200 else -1)
            assert len(requests) == int(bool(retained)), 'No HTTP/backend body for entirely suppressed telemetry'
            if retained:
                assert all(a is b for a, b in zip(requests[0]['events'], retained)) and len(requests[0]['events']) == len(retained)

    # Execute WorkInitializer's actual persisted-context iterator and scheduler.
    contexts, scheduled = [{'backend': 'cct'}], []
    def restart_call(target, args):
        if 'EventStore;->loadActiveContexts(' in target:
            return contexts
        if 'WorkScheduler;->schedule(' in target:
            scheduled.append((args[1], args[2]))
            return None
        return common(target, args)
    restart = 'lambda$ensureContextsScheduled$0$com-google-android-datatransport-runtime-scheduling-jobscheduling-WorkInitializer()Ljava/lang/Object;'
    invoke(WORK, restart, [{'store': {'real': 'store'}, 'scheduler': {'real': 'scheduler'}}], restart_call)
    assert scheduled == [(contexts[0], 1)], 'Persisted contexts still use genuine SDK scheduling'

    # The unchanged Uploader response graph starts at its actual getStatus call.
    # Its native guarded recordSuccess invokes the unchanged SQLite DELETE body.
    uploader_signature = 'logAndUpdateState(' + RUNTIME + 'TransportContext;I)' + RESPONSE
    consumer = code(UPLOADER, uploader_signature)
    start = next(i for i, line in enumerate(consumer) if '->getStatus()' in line)
    for names, http in [(sorted(MEASUREMENT), 200), (['unknown', 'FCM_CLIENT_EVENT_LOGGING'], 200),
                        (['unknown', 'FCM_CLIENT_EVENT_LOGGING'], 403), (['unknown', 'FCM_CLIENT_EVENT_LOGGING'], 500)]:
        records = [{'transport': name, 'id': i + 1} for i, name in enumerate(names)]
        response, requests = sender(records, http)
        deleted, retry, queue = [], [], list(records)
        context = contexts[0]
        state = {'guard': {'real': 'guard'}, 'eventStore': {'real': 'store'}, 'workScheduler': {'real': 'scheduler'}}
        def consume(target, args):
            if target.startswith(RESPONSE + '->getStatus('):
                return args[0]['status']
            if target.startswith(RESPONSE + '->getNextRequestWaitMillis('):
                return args[0]['wait']
            if 'Uploader$$ExternalSyntheticLambda' in target and '-><init>(' in target:
                args[0]['captures'] = args[1:]
                return None
            if 'SynchronizationGuard;->runCriticalSection(' in target:
                task = args[1]
                if '$$ExternalSyntheticLambda5;' in task['type']:
                    return int(bool(queue))
                if '$$ExternalSyntheticLambda8;' in task['type']:
                    signature = 'lambda$logAndUpdateState$5$com-google-android-datatransport-runtime-scheduling-jobscheduling-Uploader(Ljava/lang/Iterable;)Ljava/lang/Object;'
                    return invoke(UPLOADER, signature, task['captures'], consume)
                if '$$ExternalSyntheticLambda7;' in task['type']:
                    return 0  # Original retained retry transaction, no deletion.
                if '$$ExternalSyntheticLambda1;' in task['type']:
                    return 0  # Original retained next-call bookkeeping.
                raise AssertionError('Unexpected native queue transaction: ' + str(task['type']))
            if 'EventStore;->recordSuccess(' in target:
                return invoke(STORE, 'recordSuccess(Ljava/lang/Iterable;)V', args, consume)
            if target.startswith(STORE + '->toIdList('):
                return '(' + ','.join(str(event['id']) for event in args[0]) + ')'
            if target == 'Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V':
                args[0]['text'] = args[1]
                return None
            if target == 'Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;':
                args[0]['text'] += args[1]
                return args[0]
            if target == 'Ljava/lang/StringBuilder;->toString()Ljava/lang/String;':
                return args[0]['text']
            if target.startswith(STORE + '->getDb('):
                return {'db': 'fixture'}
            if 'SQLiteDatabase;->compileStatement(' in target:
                return {'sql': args[1]}
            if 'SQLiteStatement;->execute()' in target:
                assert args[0]['sql'] == 'DELETE FROM events WHERE _id in (' + ','.join(str(event['id']) for event in records) + ')'
                deleted.extend(queue)
                queue.clear()
                return None
            if target == 'Ljava/lang/Boolean;->booleanValue()Z':
                return int(args[0])
            if target == 'Ljava/lang/Math;->max(JJ)J':
                return max(args[0], args[2])
            if 'TransportContext;->shouldUploadClientHealthMetrics()' in target:
                return 0
            if 'WorkScheduler;->schedule(' in target:
                retry.append((args[1], args[2], args[3]))
                return None
            return common(target, args)
        result = execute(consumer, {'p0': state, 'p1': context, 'p2': 1, 'v3': response,
                                    'v6': records, 'v8': 0, 'v9': 0}, consume, start=start)
        assert result is response, 'Preserve original response object/status through restart queue processing'
        transient = 'TRANSIENT_ERROR:' in response['status']
        assert deleted == ([] if transient else records), 'Native fatal/OK paths delete; transient preserves original queue'
        assert retry == ([(context, 2, 1)] if transient else []), 'Preserve genuine retry attempt and scheduling'

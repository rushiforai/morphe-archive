"""Typed execution of Brabant instructions with explicit platform boundaries."""
import re

from brabant_contracts import CONTRACTS
from brabant_ads_contracts import ADS_CONTRACTS
from brabant_smali import canonical
from rtl_vm import Memory, Reference, equal, execute, is_zero
from verify_dumpert import absolute_registers, audit_call


class Fixture:
    def __init__(self, source, declarations, sdk_read):
        self.source, self.declarations, self.sdk_read = source, declarations, sdk_read
        self.rows = {(r[0], r[1]): r for r in CONTRACTS + ADS_CONTRACTS}
        self.programs, self.events, self.native = {}, [], set()
        self.true, self.false = Reference(True, 'Ljava/lang/Boolean;'), Reference(False, 'Ljava/lang/Boolean;')
        self.statics = {'Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;': self.true,
                        'Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;': self.false}
        self.memory = Memory(self.parents, self.statics)

    def parents(self, owner):
        if owner in self.declarations.classes:
            cls = self.declarations.classes[owner]
            return tuple(x for x in (cls.superclass, *cls.interfaces) if x)
        cls = self.sdk_read(owner)
        assert cls, 'Missing Brabant fixture hierarchy: ' + owner
        return tuple(x for x in (cls[1], *self.sdk_read.interfaces(owner)) if x)

    def defaults(self, value):
        """Java zero-initialization from actual instance-field declarations."""
        owner = value.descriptor
        while owner in self.declarations.classes:
            for declaration in re.findall(r'^\.field (.+)$', self.source.text(owner), re.M):
                if 'static' in declaration.split(): continue
                field = re.search(r' ([^ ]+):([^ ]+)(?: |$)', ' ' + declaration)
                assert field, 'Unknown Brabant field declaration'
                value.value.setdefault(owner + '->' + field[1] + ':' + field[2], 0)
            owner = self.declarations.classes[owner].superclass
        return value

    def new(self, owner, fields=None):
        value = self.defaults(Reference({}, owner))
        value.value.update(fields or {})
        return value

    def program(self, owner, signature):
        key = owner, signature
        if key not in self.programs:
            assert key in self.rows, 'Unpinned Brabant execution method: ' + str(key)
            value = canonical(self.source.body(*key))
            value.program.instructions = [absolute_registers(x, self.rows[key][3]) for x in value.program.instructions]
            for line in value.program.instructions:
                if line.startswith('sget-object '):
                    field = line.split(', ', 1)[1]
                    self.statics.setdefault(field, Reference({}, field.rsplit(':', 1)[1]))
            self.programs[key] = value.program
        return self.programs[key]

    def run(self, owner, signature, args=(), start=0, stop_at=(), registers=None):
        locals_ = self.rows[owner, signature][3]
        frame = {'v' + str(locals_ + i): value for i, value in enumerate(args)}
        for name, value in (registers or {}).items():
            frame['v' + str(locals_ + int(name[1:])) if name.startswith('p') else name] = value
        result = execute(self.program(owner, signature), frame, self.invoke, start=start,
                         stop_at=stop_at, memory=self.memory,
                         trace=lambda line: audit_call(line, owner, self.declarations, self.sdk_read))
        return result, frame

    def method(self, owner, prefix):
        matches = [signature for o, signature in self.rows if o == owner and signature.startswith(prefix)]
        assert len(matches) == 1, 'Ambiguous Brabant execution method: ' + owner + prefix
        return matches[0]

    def invoke(self, target, args):
        owner, signature = target.split('->', 1)
        if (owner, signature) in self.native:
            if signature.startswith('<init>('): self.defaults(args[0])
            return self.run(owner, signature, args)[0]
        if target == 'Ljava/lang/Object;-><init>()V':
            self.defaults(args[0]); return None
        if target == 'Ljava/lang/Object;->getClass()Ljava/lang/Class;':
            assert not is_zero(args[0]), 'Native Brabant null check'
            return Reference({}, 'Ljava/lang/Class;')
        if target == 'Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V':
            args[0].value['message'] = args[1]; return None
        if target == 'Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;': return self.true if args[0] else self.false
        if target == 'Ljava/lang/Boolean;->booleanValue()Z': return int(args[0].value)
        if target == 'Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;': return args[0] + args[1]
        if target == 'Ljava/lang/String;->valueOf(I)Ljava/lang/String;': return str(args[0])
        if target == 'Ljava/lang/Number;->intValue()I': return args[0].value
        if target == 'Lmu;->D(Ljava/lang/Object;)Ljava/util/List;': return Reference([args[0]], 'Ljava/util/ArrayList;')
        if target == 'Ljava/util/Collection;->isEmpty()Z': return int(not args[0].value)
        if target == 'Ljava/util/ArrayList;->get(I)Ljava/lang/Object;': return args[0].value[args[1]]
        if target == 'Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;': return args[0].value.pop(args[1])
        if target == 'Li85;->add(Ljava/lang/Object;)Z': args[0].value.append(args[1]); return 1
        if target in {'Lgq3;->W(I)V', 'Lgq3;->p(Z)V'}:
            self.events.append(('compose-group', target, args[1])); return None
        if target == 'Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I': return 0
        if target == 'Ldk4;->l(Ljava/lang/Object;Ljava/lang/Object;)Z':
            return int(args[0] == args[1]) if isinstance(args[0], str) and isinstance(args[1], str) else int(equal(*args))
        if owner == 'Ljava/util/LinkedHashMap;' and signature in {'<init>()V', '<init>(Ljava/util/Map;)V'}:
            args[0].value = dict(args[1].value) if len(args) > 1 else {}; return None
        if signature == 'get(Ljava/lang/Object;)Ljava/lang/Object;' and owner == 'Ljava/util/Map;':
            return args[0].value.get(args[1], 0)
        if signature == 'put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;' and owner in {'Ljava/util/Map;', 'Ljava/util/LinkedHashMap;'}:
            previous = args[0].value.get(args[1], 0); args[0].value[args[1]] = args[2]; return previous
        if target == 'Lmq;->d(Ljava/lang/Throwable;)V': self.events.append(('log', args[1])); return None
        if target == 'Lk9;->onFailure(Ljava/lang/Throwable;)V':
            self.events.append(('failure', args[0], args[1]))
            return self.run(args[0].descriptor, signature, args)[0]
        if target == 'Lao3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;': return args[0].value(args[1])
        if target == 'Lw29;->n(Ljava/lang/Object;Ljava/lang/Object;)Z':
            assert is_zero(args[1]); args[0].value['value'] = args[2]
            self.events.append(('reset', args[2])); return 1
        if target == 'Lt29;->getValue()Ljava/lang/Object;': return args[0].value['value']
        if target == 'Llc6;->setValue(Ljava/lang/Object;)V' or target == 'Lmb6;->k(Ljava/lang/Object;)V':
            args[0].value['value'] = args[1]; self.events.append(('published', args[1])); return None
        if target == 'Landroid/view/View;->setVisibility(I)V':
            args[0].value['visibility'] = args[1]; return None
        if target == 'Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;':
            return Reference({'view': args[0]}, 'Landroid/view/ViewPropertyAnimator;')
        if owner == 'Landroid/view/ViewPropertyAnimator;':
            if signature.startswith('alpha('): assert args[1] == 0; args[0].value['alpha'] = 0
            elif signature.startswith('setDuration('): args[0].value['duration'] = args[1]
            elif signature.startswith('withEndAction('): args[0].value['end'] = args[1]
            elif signature == 'start()V': self.events.append(('animation', args[0])); return None
            else: raise AssertionError('Unknown Brabant animator boundary: ' + target)
            return args[0]
        if target == 'Lja;->Q0(Lja;IILyn3;)V':
            # Android animation/rendering is the boundary; real ph6 supplies both zeros.
            assert args[1:3] == [0, 0]; self.events.append(('native-zero-dimensions', *args)); return None
        if target == 'Llq8;->c(Lcom/bluebillywig/bbnativeshared/model/EmbedObject;Ljava/util/Map;)V':
            self.events.append(('shorts-config', args[0], args[1], args[2])); return None
        if owner == 'Lbo1;' and signature == '<init>()V': self.defaults(args[0]); return None
        if owner == 'Lkj7;' and signature in {'D()V', 'v()V', 'l()V'}:
            # Retained native coordinator/lifecycle entry points, not an IO claim.
            self.events.append(('native-content-coordination', signature, args[0])); return None
        if target == 'Lqw2;->c(Lfy2;)V':
            self.events.append(('native-content-event', args[0], args[1])); return None
        raise AssertionError('Unmodeled Brabant external invocation: ' + target)

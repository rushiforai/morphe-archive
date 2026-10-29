"""Execute VI bytecode with explicit platform/transport boundaries."""
import hashlib
import hmac
import re
from urllib.parse import urlsplit, urljoin, parse_qs

from vi_contracts import ARTICLE_CONTRACTS
from brabant_smali import canonical
from rtl_vm import Memory, Reference, VmThrown, execute, is_zero, equal
from verify_dumpert import absolute_registers, audit_call

P = 'Lcom/pxr/pxropenapigenerator/ktorSupertokens/'
AUTH = 'Lnl/vi/core/authentication/Authentication;'
IAP = P+'common/inAppSubscription/InAppSubscriptionImpl;'
SENDER = P+'extensions/KtorHttpRequestBuilderExtensionsKt;'
GEN_SIGNATURE = 'generateInAppSubscriptionAuthValue()Ljava/lang/String;'
DATA = 'Lnl/vi/feature/articleDetail/data/articleDetailDataSource/ArticleDetailDataSourceImp;'
HELPER = 'morpheArticleRequest(Lio/ktor/client/request/HttpRequestBuilder;Z)Z'
REDIRECT_HELPER = 'morpheArticleRedirect(Lio/ktor/client/request/HttpRequestBuilder;)V'
REDIRECT = 'Lio/ktor/client/plugins/HttpRedirect$Plugin;'
REDIRECT_SIG = 'handleCall(Lio/ktor/client/plugins/Sender;Lio/ktor/client/request/HttpRequestBuilder;Lio/ktor/client/call/HttpClientCall;ZLio/ktor/client/HttpClient;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;'
SENDER_SIG = 'executeCall(Lio/ktor/client/request/HttpRequestBuilder;Landroid/content/Context;Lio/ktor/client/plugins/Sender;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;'
CONT = SENDER[:-1]+'$executeCall$1;'


class Fixture:
    def __init__(self, source, declarations, sdk_read):
        self.source, self.declarations, self.sdk_read = source, declarations, sdk_read
        self.rows = {r[:2]: r for r in ARTICLE_CONTRACTS}
        self.rows[SENDER, HELPER] = (SENDER, HELPER, 9, 3, 0, '')
        self.rows[SENDER, REDIRECT_HELPER] = (SENDER, REDIRECT_HELPER, 9, 3, 0, '')
        self.programs, self.events, self.requests = {}, [], []
        self.statics = {AUTH+'->proUser:Z': 0}
        self.memory = Memory(self.parents, self.statics)
        self.native = {(IAP,'<clinit>()V'), (IAP,'<init>()V'), (AUTH,'isPro()Z')}
        self.native |= {(SENDER,SENDER_SIG),(CONT,'<init>(Lkotlin/coroutines/Continuation;)V'),(CONT,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;')}
        self.native |= {(o,s) for o,s in self.rows if o=='Lnl/vi/feature/articleDetail/data/NativeArticleViewState;'}
        self.pro, self.iap = False, False
        self.now = 1793222400
        self.device_offset = self.amsterdam_offset = 3600
        self.auth = self.new(AUTH)
        self.suspended = Reference({}, 'Ljava/lang/Object;')
        self.response = Reference({}, 'Lio/ktor/client/call/HttpClientCall;')
        self.required_result = self.network_result = None
        self.required_cont = self.network_cont = None
        self.network_requests = []
        self.next_auth = Reference({}, P+'common/nextAuth/NextAuthenticationManager;')
        self.api = Reference({}, 'Lorg/openapitools/client/apis/NewsApi;')
        self.premium = Reference({'value':'premium'}, 'Lorg/openapitools/client/models/Scope;')
        self.statics['Lorg/openapitools/client/models/Scope;->PREMIUM:Lorg/openapitools/client/models/Scope;'] = self.premium
        self.statics['Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;'] = Reference({}, 'Lkotlin/Unit;')
        self.statics[P+'common/security/cryptoGraphicHashing/CryptoGraphicHashing;->Companion:'+P+'common/security/cryptoGraphicHashing/CryptoGraphicHashing$Companion;'] = Reference({},P+'common/security/cryptoGraphicHashing/CryptoGraphicHashing$Companion;')
        self.run(IAP, '<clinit>()V')
        self.subscription = self.statics[IAP+'->INSTANCE:'+IAP]

    def parents(self, owner):
        if owner in self.declarations.classes:
            c = self.declarations.classes[owner]
            return tuple(x for x in (c.superclass,*c.interfaces) if x)
        c = self.sdk_read(owner)
        assert c, 'Missing VI platform type: '+owner
        return tuple(x for x in (c[1],*self.sdk_read.interfaces(owner)) if x)

    def defaults(self, value):
        current = value.descriptor
        while current in self.declarations.classes:
            for line in self.source.text(current).splitlines():
                if not line.startswith('.field ') or 'static' in line.split(): continue
                m = re.search(r' ([^ ]+):([^ ]+)(?: |$)',line)
                assert m, 'VI field declaration'
                value.value.setdefault(current+'->'+m[1]+':'+m[2], 0)
            current = self.declarations.classes[current].superclass
        return value

    def new(self, owner, fields=None):
        value = self.defaults(Reference({}, owner))
        value.value.update(fields or {})
        return value

    def program(self, owner, sig):
        key=owner,sig
        if key not in self.programs:
            assert key in self.rows, 'Unpinned VI execution method: '+str(key)
            v=canonical(self.source.body(owner,sig))
            v.program.instructions=[absolute_registers(l,self.rows[key][3]) for l in v.program.instructions]
            self.programs[key]=v.program
        return self.programs[key]

    def run(self, owner, sig, args=(), start=0, stop_at=(), registers=None):
        local=self.rows[owner,sig][3]
        frame={'v'+str(local+i):v for i,v in enumerate(args)}
        frame.update(registers or {})
        result=execute(self.program(owner,sig),frame,self.invoke,start=start,stop_at=stop_at,memory=self.memory,
                       trace=lambda line:audit_call(line,owner,self.declarations,self.sdk_read))
        return result,frame

    def request(self, url, method='GET'):
        return Reference({'url':Reference(urlsplit(url),'Lio/ktor/http/URLBuilder;'),'method':method,'headers':{},'attributes':{}},'Lio/ktor/client/request/HttpRequestBuilder;')

    def invoke(self,target,args):
        owner,sig=target.split('->',1)
        if sig.startswith('<init>(') and isinstance(args[0],Reference) and isinstance(args[0].value,dict):self.defaults(args[0])
        if (owner,sig) in self.native or owner==SENDER and sig in {HELPER,REDIRECT_HELPER}: return self.run(owner,sig,args)[0]
        if target=='Ljava/lang/Object;-><init>()V': return None
        if target=='Lkotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V': return None
        if target=='Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;':return self.suspended
        if target=='Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V':
            if isinstance(args[0],Reference) and args[0].descriptor=='Lkotlin/Result$Failure;':raise VmThrown(args[0].value['exception'])
            return None
        if target=='Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;':return 0
        if target=='Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V':args[0].value['message']=args[1];return None
        if target==SENDER+'->appendRequiredHeaders(Lio/ktor/client/request/HttpRequestBuilder;Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;':
            self.events.append('required-headers');self.required_cont=args[2]
            if isinstance(self.required_result,VmThrown):raise self.required_result
            args[0].value['headers']['required-fixture']='retained'
            return self.required_result or self.statics['Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;']
        if target==P+'extensions/HeadersBuilderExtensionsKt;->appendAuthHeader(Lio/ktor/http/HeadersBuilder;Ljava/lang/String;)V':
            self.events.append('session-auth');args[0].value['session-fixture']='retained';return None
        if target=='Lio/ktor/client/plugins/Sender;->execute(Lio/ktor/client/request/HttpRequestBuilder;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;':
            self.events.append('network');self.network_cont=args[2]
            self.network_requests.append(args[1])
            if isinstance(self.network_result,VmThrown):raise self.network_result
            return self.network_result or self.response
        if target==P+'extensions/KtorHttpClientCallExtensionsKt;->saveTokenFromHeader(Lio/ktor/client/call/HttpClientCall;Landroid/content/Context;)V':
            assert args[0] is self.response;self.events.append('save-token');return None
        if target=='Ljava/lang/Object;->getClass()Ljava/lang/Class;':
            assert not is_zero(args[0]); return Reference({},'Ljava/lang/Class;')
        if owner=='Lkotlin/jvm/internal/Intrinsics;' and sig.startswith(('checkNotNull','checkNotNullParameter','checkNotNullExpressionValue')):
            assert not is_zero(args[0]), 'VI native null check'; return None
        if owner=='Lkotlin/jvm/internal/Intrinsics;' and sig.startswith('areEqual('): return int(args[0]==args[1] if all(isinstance(x,str) for x in args) else equal(*args))
        if target=='Lnl/vi/common/data/AppUtilitiesKt;->getAuthentication()'+AUTH: return self.auth
        if target==P+'common/moduleReference/ModuleReferenceKt;->getNextAuth()'+P+'common/nextAuth/NextAuth;': return self.next_auth
        if sig=='hasInAppSubscription()Z': return int(self.iap)
        if target==P+'common/moduleReference/ModuleReferenceKt;->getInAppSubscription()'+P+'common/inAppSubscription/InAppSubscription;': return self.subscription
        if sig=='hasInAppSubscription(Landroid/content/Context;)Z':
            assert args[0] is self.subscription; return int(self.iap)
        if sig=='getInAppSubscriptionHeaderKey()Ljava/lang/String;': return 'x-app-article'
        if sig==GEN_SIGNATURE: return self.run(IAP,GEN_SIGNATURE,args)[0]
        if target=='Lio/ktor/client/request/HttpRequestBuilder;->getHeaders()Lio/ktor/http/HeadersBuilder;': return Reference(args[0].value['headers'],'Lio/ktor/http/HeadersBuilder;')
        if target=='Lio/ktor/http/HeadersBuilder;->append(Ljava/lang/String;Ljava/lang/String;)V': args[0].value[args[1]]=args[2];return None
        if target=='Lio/ktor/http/HeadersBuilder;->remove(Ljava/lang/String;)V':args[0].value.pop(args[1],None);return None
        if target=='Lio/ktor/client/request/HttpRequestBuilder;->getAttributes()Lio/ktor/util/Attributes;':return Reference(args[0].value['attributes'],'Lio/ktor/util/Attributes;')
        if target=='Lio/ktor/util/AttributeKey;-><init>(Ljava/lang/String;)V':args[0].value['name']=args[1];return None
        if target=='Lio/ktor/util/Attributes;->put(Lio/ktor/util/AttributeKey;Ljava/lang/Object;)V':args[0].value[args[1].value['name']]=args[2];return None
        if target=='Lio/ktor/util/Attributes;->contains(Lio/ktor/util/AttributeKey;)Z':return int(args[1].value['name'] in args[0].value)
        if target=='Lio/ktor/client/request/HttpRequestBuilder;-><init>()V':args[0].value.update(self.request('https://localhost/').value);return None
        if target=='Lio/ktor/client/request/HttpRequestBuilder;->takeFromWithExecutionContext(Lio/ktor/client/request/HttpRequestBuilder;)Lio/ktor/client/request/HttpRequestBuilder;':
            # Native clone is separately whole-graph pinned: copies headers and
            # attributes via appendAll/putAll, retaining attribute key semantics.
            old=args[1].value;args[0].value.update(url=Reference(old['url'].value,'Lio/ktor/http/URLBuilder;'),method=old['method'],headers=dict(old['headers']),attributes=dict(old['attributes']))
            return args[0]
        if target=='Lio/ktor/http/URLParserKt;->takeFrom(Lio/ktor/http/URLBuilder;Ljava/lang/String;)Lio/ktor/http/URLBuilder;':args[0].value=urlsplit(urljoin(args[0].value.geturl(),args[1]));return args[0]
        if target=='Lio/ktor/http/URLBuilderKt;->getAuthority(Lio/ktor/http/URLBuilder;)Ljava/lang/String;':return args[0].value.netloc
        if target in {'Lio/ktor/util/StringValuesBuilder;->clear()V','Lio/ktor/http/ParametersBuilder;->clear()V'}:args[0].value.clear();return None
        if target=='Lio/ktor/client/plugins/HttpRedirectKt;->access$getLOGGER$p()Lorg/slf4j/Logger;':return Reference({},'Lorg/slf4j/Logger;')
        if target=='Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V':return None
        if target=='Lio/ktor/http/HttpHeaders;->getAuthorization()Ljava/lang/String;':return 'Authorization'
        if target==DATA+'->getNewsApi()Lorg/openapitools/client/apis/NewsApi;': return self.api
        if owner=='Lorg/openapitools/client/apis/NewsApi;' and sig.startswith(('getByIDNewsByDomainID$default(','getByPathNewsByDomainID$default(')):
            self.requests.append(('id' if 'getByID' in sig else 'path',args[1],args[2],args[3]))
            return Reference({},'Ljava/lang/Object;')
        if owner=='Ljava/lang/StringBuilder;':
            if sig.startswith('<init>('):args[0].value=args[1] if len(args)>1 else ''; return None
            if sig.startswith('append('):args[0].value+=str(args[1]);return args[0]
            if sig=='toString()Ljava/lang/String;':return args[0].value
        if owner=='Ljava/lang/String;':
            if sig.startswith('valueOf('):return str(args[0])
            if sig=='equals(Ljava/lang/Object;)Z':return int(args[0]==args[1])
            if sig=='equalsIgnoreCase(Ljava/lang/String;)Z':return int(isinstance(args[1],str) and args[0].lower()==args[1].lower())
            if sig=='matches(Ljava/lang/String;)Z':return int(bool(re.fullmatch(args[1],args[0])))
        if target==IAP+'->logEvent(Ljava/lang/String;)V': self.events.append('sensitive-header-log');return None
        if sig=='generateHMacSha256(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;':
            return hmac.new(args[1].encode(),args[2].encode(),hashlib.sha256).hexdigest()
        if target=='Lj$/time/LocalDateTime;->now()Lj$/time/LocalDateTime;':return Reference(self.now+self.device_offset,'Lj$/time/LocalDateTime;')
        if target=='Lj$/time/LocalDateTime;->minusMinutes(J)Lj$/time/LocalDateTime;':return Reference(args[0].value-args[1]*60,'Lj$/time/LocalDateTime;')
        if target==P+'extensions/LocalDateTimeExtensionsKt;->asEpochSeconds(Lj$/time/LocalDateTime;)J':return args[0].value-self.amsterdam_offset
        if target=='Ljava/time/Instant;->now()Ljava/time/Instant;':return Reference(self.now,'Ljava/time/Instant;')
        if target=='Ljava/time/Instant;->minusSeconds(J)Ljava/time/Instant;':return Reference(args[0].value-args[1],'Ljava/time/Instant;')
        if target=='Ljava/time/Instant;->getEpochSecond()J':return args[0].value
        if target=='Lio/ktor/client/request/HttpRequestBuilder;->getMethod()Lio/ktor/http/HttpMethod;':return Reference(args[0].value['method'],'Lio/ktor/http/HttpMethod;')
        if target=='Lio/ktor/http/HttpMethod;->getValue()Ljava/lang/String;':return args[0].value
        if target=='Lio/ktor/client/request/HttpRequestBuilder;->getUrl()Lio/ktor/http/URLBuilder;':return args[0].value['url']
        if target=='Lio/ktor/http/URLBuilder;->getHost()Ljava/lang/String;':return args[0].value.hostname or ''
        if target=='Lio/ktor/http/URLBuilder;->getProtocol()Lio/ktor/http/URLProtocol;':return Reference(args[0].value.scheme,'Lio/ktor/http/URLProtocol;')
        if target=='Lio/ktor/http/URLProtocol;->getName()Ljava/lang/String;':return args[0].value
        if target=='Lio/ktor/http/URLBuilder;->getPort()I':return args[0].value.port or 0
        if target=='Lio/ktor/http/URLBuilderKt;->getEncodedPath(Lio/ktor/http/URLBuilder;)Ljava/lang/String;':return args[0].value.path
        if target=='Lio/ktor/http/URLBuilder;->getParameters()Lio/ktor/http/ParametersBuilder;':return Reference(parse_qs(args[0].value.query,keep_blank_values=True),'Lio/ktor/http/ParametersBuilder;')
        if target=='Lio/ktor/http/URLBuilder;->toString()Ljava/lang/String;':return args[0].value.geturl()
        if target=='Lio/ktor/util/StringValuesBuilder;->get(Ljava/lang/String;)Ljava/lang/String;':return args[0].value.get(args[1],[0])[0]
        if target=='Lio/ktor/util/StringValuesBuilder;->getAll(Ljava/lang/String;)Ljava/util/List;':
            result=args[0].value.get(args[1]);return Reference(result,'Ljava/util/ArrayList;') if result is not None else 0
        if target=='Ljava/util/List;->size()I':return len(args[0].value)
        if target in {'Ljava/util/List;->isEmpty()Z','Ljava/util/Collection;->isEmpty()Z'}:return int(not args[0].value)
        if target=='Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;':return Reference({'items':args[0].value,'index':0},'Ljava/util/Iterator;')
        if target=='Ljava/util/Iterator;->hasNext()Z':return int(args[0].value['index']<len(args[0].value['items']))
        if target=='Ljava/util/Iterator;->next()Ljava/lang/Object;':
            x=args[0].value;i=x['index'];x['index']+=1;return x['items'][i]
        if target=='Lkotlinx/coroutines/flow/MutableStateFlow;->getValue()Ljava/lang/Object;':return args[0].value
        if target=='Lnl/vi/feature/articleDetail/ui/viewmodels/NativeArticleViewModel;->loadNewsArticle()V':self.events.append('article-reload');return None
        if target=='Ljava/util/List;->get(I)Ljava/lang/Object;':return args[0].value[args[1]]
        if 'Landroidx/compose/runtime/Composer;->' in target:
            raise AssertionError('VI locked overlay reached Compose')
        raise AssertionError('Unmodeled VI boundary: '+target)

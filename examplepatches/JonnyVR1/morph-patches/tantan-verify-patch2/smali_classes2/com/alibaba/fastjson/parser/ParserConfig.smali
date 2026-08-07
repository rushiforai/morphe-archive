.class public Lcom/alibaba/fastjson/parser/ParserConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final AUTOTYPE_ACCEPT:Ljava/lang/String; = "fastjson.parser.autoTypeAccept"

.field public static final AUTOTYPE_SUPPORT_PROPERTY:Ljava/lang/String; = "fastjson.parser.autoTypeSupport"

.field public static final AUTO_SUPPORT:Z

.field private static final AUTO_TYPE_ACCEPT_LIST:[Ljava/lang/String;

.field public static final DENYS:[Ljava/lang/String;

.field public static final DENY_PROPERTY:Ljava/lang/String; = "fastjson.parser.deny"

.field private static final INTERNAL_WHITELIST_HASHCODES:[J

.field private static awtError:Z

.field public static global:Lcom/alibaba/fastjson/parser/ParserConfig;

.field private static guavaError:Z

.field private static jdk8Error:Z

.field private static jodaError:Z


# instance fields
.field private acceptHashCodes:[J

.field private asmEnable:Z

.field protected asmFactory:Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;

.field private autoTypeSupport:Z

.field public compatibleWithJavaBean:Z

.field protected defaultClassLoader:Ljava/lang/ClassLoader;

.field private denyHashCodes:[J

.field private final deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/alibaba/fastjson/util/IdentityHashMap<",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;",
            ">;"
        }
    .end annotation
.end field

.field public final fieldBased:Z

.field private jacksonCompatible:Z

.field private final mixInDeserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/alibaba/fastjson/util/IdentityHashMap<",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/util/IdentityHashMap<",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;",
            ">;>;"
        }
    .end annotation
.end field

.field private modules:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/alibaba/fastjson/spi/Module;",
            ">;"
        }
    .end annotation
.end field

.field public propertyNamingStrategy:Lcom/alibaba/fastjson/PropertyNamingStrategy;

.field public final symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

.field private final typeMapping:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 60

    .line 1
    const-string v0, "fastjson.parser.deny"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/alibaba/fastjson/util/IOUtils;->getStringProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/ParserConfig;->splitItemsFormProperty(Ljava/lang/String;)[Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/alibaba/fastjson/parser/ParserConfig;->DENYS:[Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "fastjson.parser.autoTypeSupport"

    .line 14
    .line 15
    invoke-static {v0}, Lcom/alibaba/fastjson/util/IOUtils;->getStringProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "true"

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    sput-boolean v0, Lcom/alibaba/fastjson/parser/ParserConfig;->AUTO_SUPPORT:Z

    .line 26
    .line 27
    const-string v0, "fastjson.parser.autoTypeAccept"

    .line 28
    .line 29
    invoke-static {v0}, Lcom/alibaba/fastjson/util/IOUtils;->getStringProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/ParserConfig;->splitItemsFormProperty(Ljava/lang/String;)[Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x0

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    new-array v0, v1, [Ljava/lang/String;

    .line 41
    .line 42
    :cond_0
    sput-object v0, Lcom/alibaba/fastjson/parser/ParserConfig;->AUTO_TYPE_ACCEPT_LIST:[Ljava/lang/String;

    .line 43
    .line 44
    const-string v58, "org.springframework.security.core.authority.SimpleGrantedAuthority"

    .line 45
    .line 46
    const-string v59, "org.springframework.security.core.userdetails.User"

    .line 47
    .line 48
    const-string v2, "java.awt.Rectangle"

    .line 49
    .line 50
    const-string v3, "java.awt.Point"

    .line 51
    .line 52
    const-string v4, "java.awt.Font"

    .line 53
    .line 54
    const-string v5, "java.awt.Color"

    .line 55
    .line 56
    const-string v6, "com.alibaba.fastjson.util.AntiCollisionHashMap"

    .line 57
    .line 58
    const-string v7, "com.alipay.sofa.rpc.core.exception.SofaTimeOutException"

    .line 59
    .line 60
    const-string v8, "java.util.Collections.UnmodifiableMap"

    .line 61
    .line 62
    const-string v9, "java.util.concurrent.ConcurrentSkipListMap"

    .line 63
    .line 64
    const-string v10, "java.util.concurrent.ConcurrentSkipListSet"

    .line 65
    .line 66
    const-string v11, "org.springframework.dao.CannotAcquireLockException"

    .line 67
    .line 68
    const-string v12, "org.springframework.dao.CannotSerializeTransactionException"

    .line 69
    .line 70
    const-string v13, "org.springframework.dao.CleanupFailureDataAccessException"

    .line 71
    .line 72
    const-string v14, "org.springframework.dao.ConcurrencyFailureException"

    .line 73
    .line 74
    const-string v15, "org.springframework.dao.DataAccessResourceFailureException"

    .line 75
    .line 76
    const-string v16, "org.springframework.dao.DataIntegrityViolationException"

    .line 77
    .line 78
    const-string v17, "org.springframework.dao.DataRetrievalFailureException"

    .line 79
    .line 80
    const-string v18, "org.springframework.dao.DeadlockLoserDataAccessException"

    .line 81
    .line 82
    const-string v19, "org.springframework.dao.DuplicateKeyException"

    .line 83
    .line 84
    const-string v20, "org.springframework.dao.EmptyResultDataAccessException"

    .line 85
    .line 86
    const-string v21, "org.springframework.dao.IncorrectResultSizeDataAccessException"

    .line 87
    .line 88
    const-string v22, "org.springframework.dao.IncorrectUpdateSemanticsDataAccessException"

    .line 89
    .line 90
    const-string v23, "org.springframework.dao.InvalidDataAccessApiUsageException"

    .line 91
    .line 92
    const-string v24, "org.springframework.dao.InvalidDataAccessResourceUsageException"

    .line 93
    .line 94
    const-string v25, "org.springframework.dao.NonTransientDataAccessException"

    .line 95
    .line 96
    const-string v26, "org.springframework.dao.NonTransientDataAccessResourceException"

    .line 97
    .line 98
    const-string v27, "org.springframework.dao.OptimisticLockingFailureException"

    .line 99
    .line 100
    const-string v28, "org.springframework.dao.PermissionDeniedDataAccessException"

    .line 101
    .line 102
    const-string v29, "org.springframework.dao.PessimisticLockingFailureException"

    .line 103
    .line 104
    const-string v30, "org.springframework.dao.QueryTimeoutException"

    .line 105
    .line 106
    const-string v31, "org.springframework.dao.RecoverableDataAccessException"

    .line 107
    .line 108
    const-string v32, "org.springframework.dao.TransientDataAccessException"

    .line 109
    .line 110
    const-string v33, "org.springframework.dao.TransientDataAccessResourceException"

    .line 111
    .line 112
    const-string v34, "org.springframework.dao.TypeMismatchDataAccessException"

    .line 113
    .line 114
    const-string v35, "org.springframework.dao.UncategorizedDataAccessException"

    .line 115
    .line 116
    const-string v36, "org.springframework.jdbc.BadSqlGrammarException"

    .line 117
    .line 118
    const-string v37, "org.springframework.jdbc.CannotGetJdbcConnectionException"

    .line 119
    .line 120
    const-string v38, "org.springframework.jdbc.IncorrectResultSetColumnCountException"

    .line 121
    .line 122
    const-string v39, "org.springframework.jdbc.InvalidResultSetAccessException"

    .line 123
    .line 124
    const-string v40, "org.springframework.jdbc.JdbcUpdateAffectedIncorrectNumberOfRowsException"

    .line 125
    .line 126
    const-string v41, "org.springframework.jdbc.LobRetrievalFailureException"

    .line 127
    .line 128
    const-string v42, "org.springframework.jdbc.SQLWarningException"

    .line 129
    .line 130
    const-string v43, "org.springframework.jdbc.UncategorizedSQLException"

    .line 131
    .line 132
    const-string v44, "org.springframework.cache.support.NullValue"

    .line 133
    .line 134
    const-string v45, "org.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken"

    .line 135
    .line 136
    const-string v46, "org.springframework.security.oauth2.common.DefaultOAuth2AccessToken"

    .line 137
    .line 138
    const-string v47, "org.springframework.security.oauth2.common.DefaultOAuth2RefreshToken"

    .line 139
    .line 140
    const-string v48, "org.springframework.util.LinkedMultiValueMap"

    .line 141
    .line 142
    const-string v49, "org.springframework.util.LinkedCaseInsensitiveMap"

    .line 143
    .line 144
    const-string v50, "org.springframework.remoting.support.RemoteInvocation"

    .line 145
    .line 146
    const-string v51, "org.springframework.remoting.support.RemoteInvocationResult"

    .line 147
    .line 148
    const-string v52, "org.springframework.security.web.savedrequest.DefaultSavedRequest"

    .line 149
    .line 150
    const-string v53, "org.springframework.security.web.savedrequest.SavedCookie"

    .line 151
    .line 152
    const-string v54, "org.springframework.security.web.csrf.DefaultCsrfToken"

    .line 153
    .line 154
    const-string v55, "org.springframework.security.web.authentication.WebAuthenticationDetails"

    .line 155
    .line 156
    const-string v56, "org.springframework.security.core.context.SecurityContextImpl"

    .line 157
    .line 158
    const-string v57, "org.springframework.security.authentication.UsernamePasswordAuthenticationToken"

    .line 159
    .line 160
    filled-new-array/range {v2 .. v59}, [Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    const/16 v2, 0x3a

    .line 165
    .line 166
    new-array v2, v2, [J

    .line 167
    .line 168
    move v3, v1

    .line 169
    :goto_0
    const/16 v4, 0x3a

    .line 170
    .line 171
    if-ge v3, v4, :cond_1

    .line 172
    .line 173
    aget-object v4, v0, v3

    .line 174
    .line 175
    invoke-static {v4}, Lcom/alibaba/fastjson/util/TypeUtils;->fnv1a_64(Ljava/lang/String;)J

    .line 176
    .line 177
    .line 178
    move-result-wide v4

    .line 179
    aput-wide v4, v2, v3

    .line 180
    .line 181
    add-int/lit8 v3, v3, 0x1

    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_1
    invoke-static {v2}, Ljava/util/Arrays;->sort([J)V

    .line 185
    .line 186
    .line 187
    sput-object v2, Lcom/alibaba/fastjson/parser/ParserConfig;->INTERNAL_WHITELIST_HASHCODES:[J

    .line 188
    .line 189
    new-instance v0, Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 190
    .line 191
    invoke-direct {v0}, Lcom/alibaba/fastjson/parser/ParserConfig;-><init>()V

    .line 192
    .line 193
    .line 194
    sput-object v0, Lcom/alibaba/fastjson/parser/ParserConfig;->global:Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 195
    .line 196
    sput-boolean v1, Lcom/alibaba/fastjson/parser/ParserConfig;->awtError:Z

    .line 197
    .line 198
    sput-boolean v1, Lcom/alibaba/fastjson/parser/ParserConfig;->jdk8Error:Z

    .line 199
    .line 200
    sput-boolean v1, Lcom/alibaba/fastjson/parser/ParserConfig;->jodaError:Z

    .line 201
    .line 202
    sput-boolean v1, Lcom/alibaba/fastjson/parser/ParserConfig;->guavaError:Z

    .line 203
    .line 204
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 150
    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/parser/ParserConfig;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 149
    invoke-direct {p0, p1, v0, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;-><init>(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;Ljava/lang/ClassLoader;Z)V

    return-void
.end method

.method private constructor <init>(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;Ljava/lang/ClassLoader;Z)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/alibaba/fastjson/util/IdentityHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 10
    .line 11
    new-instance v0, Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 12
    .line 13
    const/16 v1, 0x10

    .line 14
    .line 15
    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->mixInDeserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 19
    .line 20
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 21
    .line 22
    const/high16 v2, 0x3f400000    # 0.75f

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    invoke-direct {v0, v1, v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->typeMapping:Ljava/util/concurrent/ConcurrentMap;

    .line 29
    .line 30
    sget-boolean v0, Lcom/alibaba/fastjson/util/ASMUtils;->IS_ANDROID:Z

    .line 31
    .line 32
    xor-int/2addr v0, v3

    .line 33
    iput-boolean v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmEnable:Z

    .line 34
    .line 35
    new-instance v0, Lcom/alibaba/fastjson/parser/SymbolTable;

    .line 36
    .line 37
    const/16 v1, 0x1000

    .line 38
    .line 39
    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/parser/SymbolTable;-><init>(I)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

    .line 43
    .line 44
    sget-boolean v0, Lcom/alibaba/fastjson/parser/ParserConfig;->AUTO_SUPPORT:Z

    .line 45
    .line 46
    iput-boolean v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->autoTypeSupport:Z

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    iput-boolean v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->jacksonCompatible:Z

    .line 50
    .line 51
    sget-boolean v1, Lcom/alibaba/fastjson/util/TypeUtils;->compatibleWithJavaBean:Z

    .line 52
    .line 53
    iput-boolean v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->compatibleWithJavaBean:Z

    .line 54
    .line 55
    new-instance v1, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->modules:Ljava/util/List;

    .line 61
    .line 62
    const/16 v1, 0x50

    .line 63
    .line 64
    new-array v1, v1, [J

    .line 65
    .line 66
    fill-array-data v1, :array_0

    .line 67
    .line 68
    .line 69
    iput-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->denyHashCodes:[J

    .line 70
    .line 71
    sget-object v1, Lcom/alibaba/fastjson/parser/ParserConfig;->AUTO_TYPE_ACCEPT_LIST:[Ljava/lang/String;

    .line 72
    .line 73
    array-length v1, v1

    .line 74
    new-array v1, v1, [J

    .line 75
    .line 76
    move v2, v0

    .line 77
    :goto_0
    sget-object v3, Lcom/alibaba/fastjson/parser/ParserConfig;->AUTO_TYPE_ACCEPT_LIST:[Ljava/lang/String;

    .line 78
    .line 79
    array-length v4, v3

    .line 80
    if-ge v2, v4, :cond_0

    .line 81
    .line 82
    aget-object v3, v3, v2

    .line 83
    .line 84
    invoke-static {v3}, Lcom/alibaba/fastjson/util/TypeUtils;->fnv1a_64(Ljava/lang/String;)J

    .line 85
    .line 86
    .line 87
    move-result-wide v3

    .line 88
    aput-wide v3, v1, v2

    .line 89
    .line 90
    add-int/lit8 v2, v2, 0x1

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_0
    invoke-static {v1}, Ljava/util/Arrays;->sort([J)V

    .line 94
    .line 95
    .line 96
    iput-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->acceptHashCodes:[J

    .line 97
    .line 98
    iput-boolean p3, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->fieldBased:Z

    .line 99
    .line 100
    if-nez p1, :cond_2

    .line 101
    .line 102
    sget-boolean p3, Lcom/alibaba/fastjson/util/ASMUtils;->IS_ANDROID:Z

    .line 103
    .line 104
    if-nez p3, :cond_2

    .line 105
    .line 106
    if-nez p2, :cond_1

    .line 107
    .line 108
    :try_start_0
    new-instance p2, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;

    .line 109
    .line 110
    new-instance p3, Lcom/alibaba/fastjson/util/ASMClassLoader;

    .line 111
    .line 112
    invoke-direct {p3}, Lcom/alibaba/fastjson/util/ASMClassLoader;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-direct {p2, p3}, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;-><init>(Ljava/lang/ClassLoader;)V

    .line 116
    .line 117
    .line 118
    move-object p1, p2

    .line 119
    goto :goto_1

    .line 120
    :cond_1
    new-instance p3, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;

    .line 121
    .line 122
    invoke-direct {p3, p2}, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;-><init>(Ljava/lang/ClassLoader;)V
    :try_end_0
    .catch Ljava/lang/ExceptionInInitializerError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/AccessControlException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    .line 124
    .line 125
    move-object p1, p3

    .line 126
    :catch_0
    :cond_2
    :goto_1
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmFactory:Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;

    .line 127
    .line 128
    if-nez p1, :cond_3

    .line 129
    .line 130
    iput-boolean v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmEnable:Z

    .line 131
    .line 132
    :cond_3
    invoke-direct {p0}, Lcom/alibaba/fastjson/parser/ParserConfig;->initDeserializers()V

    .line 133
    .line 134
    .line 135
    sget-object p1, Lcom/alibaba/fastjson/parser/ParserConfig;->DENYS:[Ljava/lang/String;

    .line 136
    .line 137
    invoke-direct {p0, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->addItemsToDeny([Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    sget-object p1, Lcom/alibaba/fastjson/parser/ParserConfig;->AUTO_TYPE_ACCEPT_LIST:[Ljava/lang/String;

    .line 141
    .line 142
    invoke-direct {p0, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->addItemsToAccept([Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    nop

    .line 147
    :array_0
    .array-data 8
        -0x7f2f38f433d015feL    # -9.556794763479643E-305
        -0x7903d40641508511L    # -5.085553800937495E-275
        -0x780ad5e4f815cc5aL
        -0x71522bf34d56bbbdL
        -0x708a0605f20fc080L    # -3.455901468587826E-234
        -0x6e8d5ac0ea86cf51L
        -0x6dedd28ef1c9b048L    # -1.257180119856368E-221
        -0x6dedd28ef1c9b048L    # -1.257180119856368E-221
        -0x6bcfa3d9a7f08c3bL    # -1.943861383644949E-211
        -0x6bc886d7ce2082c1L
        -0x5edc59d06ce874e0L    # -4.802155510082355E-149
        -0x57a77d31efbb3bb0L
        -0x55c250024ef3b6c9L
        -0x5000b36a4665ccb3L    # -1.6894051133204177E-77
        -0x4bf0cbe38b9136b1L    # -6.213767217225293E-58
        -0x4817128a80a2ec5eL    # -2.2892361373052172E-39
        -0x4322623ed8990f32L    # -1.644030941651994E-15
        -0x3ff41e21450d7f75L    # -3.485288105512216
        -0x3d99b2f6a71301b4L    # -7.662539098639468E11
        -0x38a661401c18dbfaL    # -5.3210898116926836E35
        -0x369c96af7d028d72L    # -3.463106763999075E45
        -0x2e10320b4cce92ccL    # -4.9428513655242083E86
        -0x26362409442d844fL    # -3.418880144874191E124
        -0x20d2200cef324c8bL    # -3.0559968239287952E150
        -0x1f651b9fb7bda7d1L    # -2.3076098125244163E157
        -0x1e6e67fb2a40b971L    # -9.894137060283861E161
        -0x1d14c5381a93b982L    # -3.211360471030518E168
        -0x19fc295ae05296d5L    # -2.6342395696172524E183
        -0x16e7b41aa4e269d6L    # -1.816185970555075E198
        -0x160df452da09f7f9L    # -2.2100835374064227E202
        -0x388c51df37d896fL
        -0x2a4039effa928e0L    # -7.14947811210233E295
        -0x22e57f0e12cbfbL
        0x10e067cd55c5e5L
        0x761619136cc13eL
        0x3085068cb7201b8L
        0x45b11bc78a3aba3L
        0xb6e292fa5955adeL
        0xee6511b66fd5ef0L    # 6.854342740564376E-237
        0x10b2bdca849d9b3eL    # 3.09032861507223E-228
        0x144277b467723158L    # 4.388573993986807E-211
        0x14db2e6fead04af0L    # 3.307156557815155E-208
        0x154b6cb22d294cfaL    # 4.271035506616844E-206
        0x193b2697eaaed41aL    # 3.9000001662652114E-187
        0x1e0a8c3358ff3daeL    # 5.762601583556236E-164
        0x24d2f6048fef4e49L
        0x275d0732b877af29L
        0x2adfefbbfe29d931L
        0x2b3a37467a344cdfL
        0x2d308dbbc851b0d8L    # 5.078962391870398E-91
        0x313bb4abd8d4554cL    # 1.56808971921097E-71
        0x332f0b5369a18310L
        0x339a3e0b6beebee9L    # 4.0826654570968825E-60
        0x33c64b921f523f2fL    # 2.77486720533494E-59
        0x34a81ee78429fdf1L    # 4.918595094295287E-55
        0x3826f4b2380c8b9bL    # 3.373058177088523E-38
        0x398f942e01920cf0L    # 1.9461954727645544E-31
        0x42d11a560fc9fba9L    # 7.521924278884664E13
        0x43320dc9d2ae0892L    # 5.08171005500021E15
        0x440e89208f445fb9L    # 7.041042216469549E19
        0x46c808a4b5841f57L    # 9.749252615377375E32
        0x4a3797b30328202cL    # 3.448058737338662E49
        0x4ba3e254e758d70dL    # 2.4377845509161763E56
        0x4ef08c90ff16c675L    # 1.8274816638330285E72
        0x4fd10ddc6d13821fL    # 3.085523505057036E76
        0x527db6b46ce3bcbcL    # 2.3643694017797754E89
        0x5728504a6d454ffcL    # 7.309005913296069E111
        0x599b5c1213a099acL    # 4.521565120980506E123
        0x5a5bd85c072e5efeL
        0x5ab0cb3071ab40d1L    # 7.275532043244496E128
        0x5d74d3e5b9370476L    # 1.5873759122766088E142
        0x5d92e6ddde40ed84L    # 5.762376793011253E142
        0x62db241274397c34L
        0x63a220e60a17c7b9L    # 8.757288450874107E171
        0x6749835432e0f0d2L
        0x746bd4a53ec195fbL    # 6.376313675246868E252
        0x74b50bb9260e31ffL    # 1.5429848812177576E254
        0x75cc60f5871d0fd3L    # 2.7270901325332595E259
        0x767a586a5107feefL    # 5.184902282980218E262
        0x7aa7ee3627a19cf3L    # 6.950210684357695E282
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/ClassLoader;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 148
    invoke-direct {p0, v0, p1, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;-><init>(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;Ljava/lang/ClassLoader;Z)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    const/4 v0, 0x0

    .line 147
    invoke-direct {p0, v0, v0, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;-><init>(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;Ljava/lang/ClassLoader;Z)V

    return-void
.end method

.method private addItemsToAccept([Ljava/lang/String;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    const/4 v0, 0x0

    .line 5
    :goto_0
    array-length v1, p1

    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    aget-object v1, p1, v0

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->addAccept(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    add-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    :goto_1
    return-void
.end method

.method private addItemsToDeny([Ljava/lang/String;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    const/4 v0, 0x0

    .line 5
    :goto_0
    array-length v1, p1

    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    aget-object v1, p1, v0

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->addDeny(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    add-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    :goto_1
    return-void
.end method

.method public static getFieldFromCache(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/reflect/Field;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Field;",
            ">;)",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .line 1
    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/lang/reflect/Field;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "_"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/reflect/Field;

    .line 28
    .line 29
    :cond_0
    if-nez v0, :cond_1

    .line 30
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v1, "m_"

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ljava/lang/reflect/Field;

    .line 50
    .line 51
    :cond_1
    if-nez v0, :cond_4

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    const/16 v3, 0x7a

    .line 59
    .line 60
    const/16 v4, 0x61

    .line 61
    .line 62
    if-lt v2, v4, :cond_2

    .line 63
    .line 64
    if-gt v2, v3, :cond_2

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    aget-char v5, v0, v1

    .line 71
    .line 72
    add-int/lit8 v5, v5, -0x20

    .line 73
    .line 74
    int-to-char v5, v5

    .line 75
    aput-char v5, v0, v1

    .line 76
    .line 77
    new-instance v1, Ljava/lang/String;

    .line 78
    .line 79
    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    .line 80
    .line 81
    .line 82
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Ljava/lang/reflect/Field;

    .line 87
    .line 88
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    const/4 v5, 0x2

    .line 93
    if-le v1, v5, :cond_4

    .line 94
    .line 95
    const/4 v1, 0x1

    .line 96
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    if-le v6, v5, :cond_4

    .line 105
    .line 106
    if-lt v2, v4, :cond_4

    .line 107
    .line 108
    if-gt v2, v3, :cond_4

    .line 109
    .line 110
    const/16 v2, 0x41

    .line 111
    .line 112
    if-lt v1, v2, :cond_4

    .line 113
    .line 114
    const/16 v2, 0x5a

    .line 115
    .line 116
    if-gt v1, v2, :cond_4

    .line 117
    .line 118
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eqz v1, :cond_4

    .line 131
    .line 132
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    check-cast v1, Ljava/util/Map$Entry;

    .line 137
    .line 138
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    check-cast v2, Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {p0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    if-eqz v2, :cond_3

    .line 149
    .line 150
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    check-cast p0, Ljava/lang/reflect/Field;

    .line 155
    .line 156
    return-object p0

    .line 157
    :cond_4
    return-object v0
.end method

.method public static getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/alibaba/fastjson/parser/ParserConfig;->global:Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 2
    .line 3
    return-object v0
.end method

.method private initDeserializers()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 2
    .line 3
    sget-object v1, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    .line 4
    .line 5
    const-class v2, Ljava/text/SimpleDateFormat;

    .line 6
    .line 7
    invoke-virtual {v0, v2, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 11
    .line 12
    const-class v2, Ljava/sql/Timestamp;

    .line 13
    .line 14
    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;->instance_timestamp:Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;

    .line 15
    .line 16
    invoke-virtual {v0, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 20
    .line 21
    const-class v2, Ljava/sql/Date;

    .line 22
    .line 23
    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;

    .line 24
    .line 25
    invoke-virtual {v0, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 29
    .line 30
    const-class v2, Ljava/sql/Time;

    .line 31
    .line 32
    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;

    .line 33
    .line 34
    invoke-virtual {v0, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 38
    .line 39
    const-class v2, Ljava/util/Date;

    .line 40
    .line 41
    sget-object v3, Lcom/alibaba/fastjson/serializer/DateCodec;->instance:Lcom/alibaba/fastjson/serializer/DateCodec;

    .line 42
    .line 43
    invoke-virtual {v0, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 47
    .line 48
    sget-object v2, Lcom/alibaba/fastjson/serializer/CalendarCodec;->instance:Lcom/alibaba/fastjson/serializer/CalendarCodec;

    .line 49
    .line 50
    const-class v3, Ljava/util/Calendar;

    .line 51
    .line 52
    invoke-virtual {v0, v3, v2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 56
    .line 57
    const-class v3, Ljavax/xml/datatype/XMLGregorianCalendar;

    .line 58
    .line 59
    invoke-virtual {v0, v3, v2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 63
    .line 64
    const-class v2, Lcom/alibaba/fastjson/JSONObject;

    .line 65
    .line 66
    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    .line 67
    .line 68
    invoke-virtual {v0, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 72
    .line 73
    sget-object v2, Lcom/alibaba/fastjson/serializer/CollectionCodec;->instance:Lcom/alibaba/fastjson/serializer/CollectionCodec;

    .line 74
    .line 75
    const-class v3, Lcom/alibaba/fastjson/JSONArray;

    .line 76
    .line 77
    invoke-virtual {v0, v3, v2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 81
    .line 82
    const-class v3, Ljava/util/Map;

    .line 83
    .line 84
    sget-object v4, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    .line 85
    .line 86
    invoke-virtual {v0, v3, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 90
    .line 91
    const-class v3, Ljava/util/HashMap;

    .line 92
    .line 93
    sget-object v4, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    .line 94
    .line 95
    invoke-virtual {v0, v3, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 99
    .line 100
    const-class v3, Ljava/util/LinkedHashMap;

    .line 101
    .line 102
    sget-object v4, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    .line 103
    .line 104
    invoke-virtual {v0, v3, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 108
    .line 109
    const-class v3, Ljava/util/TreeMap;

    .line 110
    .line 111
    sget-object v4, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    .line 112
    .line 113
    invoke-virtual {v0, v3, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 117
    .line 118
    const-class v3, Ljava/util/concurrent/ConcurrentMap;

    .line 119
    .line 120
    sget-object v4, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    .line 121
    .line 122
    invoke-virtual {v0, v3, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 126
    .line 127
    const-class v3, Ljava/util/concurrent/ConcurrentHashMap;

    .line 128
    .line 129
    sget-object v4, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    .line 130
    .line 131
    invoke-virtual {v0, v3, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 135
    .line 136
    const-class v3, Ljava/util/Collection;

    .line 137
    .line 138
    invoke-virtual {v0, v3, v2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 142
    .line 143
    const-class v3, Ljava/util/List;

    .line 144
    .line 145
    invoke-virtual {v0, v3, v2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 149
    .line 150
    const-class v3, Ljava/util/ArrayList;

    .line 151
    .line 152
    invoke-virtual {v0, v3, v2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 156
    .line 157
    sget-object v2, Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;

    .line 158
    .line 159
    const-class v3, Ljava/lang/Object;

    .line 160
    .line 161
    invoke-virtual {v0, v3, v2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 165
    .line 166
    const-class v3, Ljava/lang/String;

    .line 167
    .line 168
    sget-object v4, Lcom/alibaba/fastjson/serializer/StringCodec;->instance:Lcom/alibaba/fastjson/serializer/StringCodec;

    .line 169
    .line 170
    invoke-virtual {v0, v3, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 174
    .line 175
    const-class v3, Ljava/lang/StringBuffer;

    .line 176
    .line 177
    sget-object v4, Lcom/alibaba/fastjson/serializer/StringCodec;->instance:Lcom/alibaba/fastjson/serializer/StringCodec;

    .line 178
    .line 179
    invoke-virtual {v0, v3, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 183
    .line 184
    const-class v3, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    sget-object v4, Lcom/alibaba/fastjson/serializer/StringCodec;->instance:Lcom/alibaba/fastjson/serializer/StringCodec;

    .line 187
    .line 188
    invoke-virtual {v0, v3, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 192
    .line 193
    sget-object v3, Lcom/alibaba/fastjson/serializer/CharacterCodec;->instance:Lcom/alibaba/fastjson/serializer/CharacterCodec;

    .line 194
    .line 195
    sget-object v4, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    .line 196
    .line 197
    invoke-virtual {v0, v4, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 201
    .line 202
    const-class v4, Ljava/lang/Character;

    .line 203
    .line 204
    invoke-virtual {v0, v4, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 208
    .line 209
    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;

    .line 210
    .line 211
    sget-object v4, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 212
    .line 213
    invoke-virtual {v0, v4, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 217
    .line 218
    const-class v4, Ljava/lang/Byte;

    .line 219
    .line 220
    invoke-virtual {v0, v4, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 224
    .line 225
    sget-object v4, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 226
    .line 227
    invoke-virtual {v0, v4, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 231
    .line 232
    const-class v4, Ljava/lang/Short;

    .line 233
    .line 234
    invoke-virtual {v0, v4, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 238
    .line 239
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 240
    .line 241
    sget-object v5, Lcom/alibaba/fastjson/serializer/IntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/IntegerCodec;

    .line 242
    .line 243
    invoke-virtual {v0, v4, v5}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 247
    .line 248
    const-class v4, Ljava/lang/Integer;

    .line 249
    .line 250
    sget-object v5, Lcom/alibaba/fastjson/serializer/IntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/IntegerCodec;

    .line 251
    .line 252
    invoke-virtual {v0, v4, v5}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 256
    .line 257
    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 258
    .line 259
    sget-object v5, Lcom/alibaba/fastjson/serializer/LongCodec;->instance:Lcom/alibaba/fastjson/serializer/LongCodec;

    .line 260
    .line 261
    invoke-virtual {v0, v4, v5}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 265
    .line 266
    const-class v4, Ljava/lang/Long;

    .line 267
    .line 268
    sget-object v5, Lcom/alibaba/fastjson/serializer/LongCodec;->instance:Lcom/alibaba/fastjson/serializer/LongCodec;

    .line 269
    .line 270
    invoke-virtual {v0, v4, v5}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 274
    .line 275
    const-class v4, Ljava/math/BigInteger;

    .line 276
    .line 277
    sget-object v5, Lcom/alibaba/fastjson/serializer/BigIntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/BigIntegerCodec;

    .line 278
    .line 279
    invoke-virtual {v0, v4, v5}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 283
    .line 284
    const-class v4, Ljava/math/BigDecimal;

    .line 285
    .line 286
    sget-object v5, Lcom/alibaba/fastjson/serializer/BigDecimalCodec;->instance:Lcom/alibaba/fastjson/serializer/BigDecimalCodec;

    .line 287
    .line 288
    invoke-virtual {v0, v4, v5}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 292
    .line 293
    sget-object v4, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 294
    .line 295
    sget-object v5, Lcom/alibaba/fastjson/serializer/FloatCodec;->instance:Lcom/alibaba/fastjson/serializer/FloatCodec;

    .line 296
    .line 297
    invoke-virtual {v0, v4, v5}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 301
    .line 302
    const-class v4, Ljava/lang/Float;

    .line 303
    .line 304
    sget-object v5, Lcom/alibaba/fastjson/serializer/FloatCodec;->instance:Lcom/alibaba/fastjson/serializer/FloatCodec;

    .line 305
    .line 306
    invoke-virtual {v0, v4, v5}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 310
    .line 311
    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 312
    .line 313
    invoke-virtual {v0, v4, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 314
    .line 315
    .line 316
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 317
    .line 318
    const-class v4, Ljava/lang/Double;

    .line 319
    .line 320
    invoke-virtual {v0, v4, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 321
    .line 322
    .line 323
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 324
    .line 325
    sget-object v4, Lcom/alibaba/fastjson/serializer/BooleanCodec;->instance:Lcom/alibaba/fastjson/serializer/BooleanCodec;

    .line 326
    .line 327
    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 328
    .line 329
    invoke-virtual {v0, v5, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 333
    .line 334
    const-class v5, Ljava/lang/Boolean;

    .line 335
    .line 336
    invoke-virtual {v0, v5, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 337
    .line 338
    .line 339
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 340
    .line 341
    const-class v5, Ljava/lang/Class;

    .line 342
    .line 343
    invoke-virtual {v0, v5, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 344
    .line 345
    .line 346
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 347
    .line 348
    new-instance v5, Lcom/alibaba/fastjson/serializer/CharArrayCodec;

    .line 349
    .line 350
    invoke-direct {v5}, Lcom/alibaba/fastjson/serializer/CharArrayCodec;-><init>()V

    .line 351
    .line 352
    .line 353
    const-class v6, [C

    .line 354
    .line 355
    invoke-virtual {v0, v6, v5}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 356
    .line 357
    .line 358
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 359
    .line 360
    const-class v5, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 361
    .line 362
    invoke-virtual {v0, v5, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 363
    .line 364
    .line 365
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 366
    .line 367
    const-class v4, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 368
    .line 369
    sget-object v5, Lcom/alibaba/fastjson/serializer/IntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/IntegerCodec;

    .line 370
    .line 371
    invoke-virtual {v0, v4, v5}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 375
    .line 376
    const-class v4, Ljava/util/concurrent/atomic/AtomicLong;

    .line 377
    .line 378
    sget-object v5, Lcom/alibaba/fastjson/serializer/LongCodec;->instance:Lcom/alibaba/fastjson/serializer/LongCodec;

    .line 379
    .line 380
    invoke-virtual {v0, v4, v5}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 381
    .line 382
    .line 383
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 384
    .line 385
    sget-object v4, Lcom/alibaba/fastjson/serializer/ReferenceCodec;->instance:Lcom/alibaba/fastjson/serializer/ReferenceCodec;

    .line 386
    .line 387
    const-class v5, Ljava/util/concurrent/atomic/AtomicReference;

    .line 388
    .line 389
    invoke-virtual {v0, v5, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 390
    .line 391
    .line 392
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 393
    .line 394
    const-class v5, Ljava/lang/ref/WeakReference;

    .line 395
    .line 396
    invoke-virtual {v0, v5, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 397
    .line 398
    .line 399
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 400
    .line 401
    const-class v5, Ljava/lang/ref/SoftReference;

    .line 402
    .line 403
    invoke-virtual {v0, v5, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 404
    .line 405
    .line 406
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 407
    .line 408
    const-class v4, Ljava/util/UUID;

    .line 409
    .line 410
    invoke-virtual {v0, v4, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 411
    .line 412
    .line 413
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 414
    .line 415
    const-class v4, Ljava/util/TimeZone;

    .line 416
    .line 417
    invoke-virtual {v0, v4, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 418
    .line 419
    .line 420
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 421
    .line 422
    const-class v4, Ljava/util/Locale;

    .line 423
    .line 424
    invoke-virtual {v0, v4, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 425
    .line 426
    .line 427
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 428
    .line 429
    const-class v4, Ljava/util/Currency;

    .line 430
    .line 431
    invoke-virtual {v0, v4, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 432
    .line 433
    .line 434
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 435
    .line 436
    const-class v4, Ljava/net/Inet4Address;

    .line 437
    .line 438
    invoke-virtual {v0, v4, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 439
    .line 440
    .line 441
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 442
    .line 443
    const-class v4, Ljava/net/Inet6Address;

    .line 444
    .line 445
    invoke-virtual {v0, v4, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 446
    .line 447
    .line 448
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 449
    .line 450
    const-class v4, Ljava/net/InetSocketAddress;

    .line 451
    .line 452
    invoke-virtual {v0, v4, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 453
    .line 454
    .line 455
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 456
    .line 457
    const-class v4, Ljava/io/File;

    .line 458
    .line 459
    invoke-virtual {v0, v4, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 460
    .line 461
    .line 462
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 463
    .line 464
    const-class v4, Ljava/net/URI;

    .line 465
    .line 466
    invoke-virtual {v0, v4, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 467
    .line 468
    .line 469
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 470
    .line 471
    const-class v4, Ljava/net/URL;

    .line 472
    .line 473
    invoke-virtual {v0, v4, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 474
    .line 475
    .line 476
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 477
    .line 478
    const-class v4, Ljava/util/regex/Pattern;

    .line 479
    .line 480
    invoke-virtual {v0, v4, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 481
    .line 482
    .line 483
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 484
    .line 485
    const-class v4, Ljava/nio/charset/Charset;

    .line 486
    .line 487
    invoke-virtual {v0, v4, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 488
    .line 489
    .line 490
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 491
    .line 492
    const-class v4, Lcom/alibaba/fastjson/JSONPath;

    .line 493
    .line 494
    invoke-virtual {v0, v4, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 495
    .line 496
    .line 497
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 498
    .line 499
    const-class v1, Ljava/lang/Number;

    .line 500
    .line 501
    invoke-virtual {v0, v1, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 502
    .line 503
    .line 504
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 505
    .line 506
    sget-object v1, Lcom/alibaba/fastjson/serializer/AtomicCodec;->instance:Lcom/alibaba/fastjson/serializer/AtomicCodec;

    .line 507
    .line 508
    const-class v3, Ljava/util/concurrent/atomic/AtomicIntegerArray;

    .line 509
    .line 510
    invoke-virtual {v0, v3, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 511
    .line 512
    .line 513
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 514
    .line 515
    const-class v3, Ljava/util/concurrent/atomic/AtomicLongArray;

    .line 516
    .line 517
    invoke-virtual {v0, v3, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 518
    .line 519
    .line 520
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 521
    .line 522
    const-class v1, Ljava/lang/StackTraceElement;

    .line 523
    .line 524
    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/StackTraceElementDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/StackTraceElementDeserializer;

    .line 525
    .line 526
    invoke-virtual {v0, v1, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 527
    .line 528
    .line 529
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 530
    .line 531
    const-class v1, Ljava/io/Serializable;

    .line 532
    .line 533
    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 534
    .line 535
    .line 536
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 537
    .line 538
    const-class v1, Ljava/lang/Cloneable;

    .line 539
    .line 540
    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 541
    .line 542
    .line 543
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 544
    .line 545
    const-class v1, Ljava/lang/Comparable;

    .line 546
    .line 547
    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 548
    .line 549
    .line 550
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 551
    .line 552
    const-class v1, Ljava/io/Closeable;

    .line 553
    .line 554
    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 555
    .line 556
    .line 557
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 558
    .line 559
    new-instance v0, Lcom/alibaba/fastjson/parser/deserializer/JSONPDeserializer;

    .line 560
    .line 561
    invoke-direct {v0}, Lcom/alibaba/fastjson/parser/deserializer/JSONPDeserializer;-><init>()V

    .line 562
    .line 563
    .line 564
    const-class v1, Lcom/alibaba/fastjson/JSONPObject;

    .line 565
    .line 566
    invoke-virtual {p0, v1, v0}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 567
    .line 568
    .line 569
    return-void
.end method

.method public static isPrimitive2(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const-class v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    const-class v0, Ljava/lang/Character;

    .line 12
    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    const-class v0, Ljava/lang/Byte;

    .line 16
    .line 17
    if-eq p0, v0, :cond_1

    .line 18
    .line 19
    const-class v0, Ljava/lang/Short;

    .line 20
    .line 21
    if-eq p0, v0, :cond_1

    .line 22
    .line 23
    const-class v0, Ljava/lang/Integer;

    .line 24
    .line 25
    if-eq p0, v0, :cond_1

    .line 26
    .line 27
    const-class v0, Ljava/lang/Long;

    .line 28
    .line 29
    if-eq p0, v0, :cond_1

    .line 30
    .line 31
    const-class v0, Ljava/lang/Float;

    .line 32
    .line 33
    if-eq p0, v0, :cond_1

    .line 34
    .line 35
    const-class v0, Ljava/lang/Double;

    .line 36
    .line 37
    if-eq p0, v0, :cond_1

    .line 38
    .line 39
    const-class v0, Ljava/math/BigInteger;

    .line 40
    .line 41
    if-eq p0, v0, :cond_1

    .line 42
    .line 43
    const-class v0, Ljava/math/BigDecimal;

    .line 44
    .line 45
    if-eq p0, v0, :cond_1

    .line 46
    .line 47
    const-class v0, Ljava/lang/String;

    .line 48
    .line 49
    if-eq p0, v0, :cond_1

    .line 50
    .line 51
    const-class v0, Ljava/util/Date;

    .line 52
    .line 53
    if-eq p0, v0, :cond_1

    .line 54
    .line 55
    const-class v0, Ljava/sql/Date;

    .line 56
    .line 57
    if-eq p0, v0, :cond_1

    .line 58
    .line 59
    const-class v0, Ljava/sql/Time;

    .line 60
    .line 61
    if-eq p0, v0, :cond_1

    .line 62
    .line 63
    const-class v0, Ljava/sql/Timestamp;

    .line 64
    .line 65
    if-eq p0, v0, :cond_1

    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/Class;->isEnum()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_0

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    const/4 p0, 0x0

    .line 75
    return p0

    .line 76
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 77
    return p0
.end method

.method public static parserAllFieldToCache(Ljava/lang/Class;Ljava/util/Map;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Field;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-interface {p1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    if-nez v5, :cond_0

    .line 20
    .line 21
    invoke-interface {p1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-class v1, Ljava/lang/Object;

    .line 38
    .line 39
    if-eq v0, v1, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->parserAllFieldToCache(Ljava/lang/Class;Ljava/util/Map;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method

.method private static splitItemsFormProperty(Ljava/lang/String;)[Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    const-string v0, ","

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method


# virtual methods
.method public addAccept(Ljava/lang/String;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->fnv1a_64(Ljava/lang/String;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->acceptHashCodes:[J

    .line 15
    .line 16
    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->binarySearch([JJ)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-ltz p1, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->acceptHashCodes:[J

    .line 24
    .line 25
    array-length v2, p1

    .line 26
    add-int/lit8 v3, v2, 0x1

    .line 27
    .line 28
    new-array v3, v3, [J

    .line 29
    .line 30
    aput-wide v0, v3, v2

    .line 31
    .line 32
    array-length v0, p1

    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-static {p1, v1, v3, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    .line 36
    .line 37
    invoke-static {v3}, Ljava/util/Arrays;->sort([J)V

    .line 38
    .line 39
    .line 40
    iput-object v3, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->acceptHashCodes:[J

    .line 41
    .line 42
    :cond_2
    :goto_0
    return-void
.end method

.method public addDeny(Ljava/lang/String;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->fnv1a_64(Ljava/lang/String;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->denyHashCodes:[J

    .line 15
    .line 16
    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->binarySearch([JJ)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-ltz p1, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->denyHashCodes:[J

    .line 24
    .line 25
    array-length v2, p1

    .line 26
    add-int/lit8 v3, v2, 0x1

    .line 27
    .line 28
    new-array v3, v3, [J

    .line 29
    .line 30
    aput-wide v0, v3, v2

    .line 31
    .line 32
    array-length v0, p1

    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-static {p1, v1, v3, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    .line 36
    .line 37
    invoke-static {v3}, Ljava/util/Arrays;->sort([J)V

    .line 38
    .line 39
    .line 40
    iput-object v3, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->denyHashCodes:[J

    .line 41
    .line 42
    :cond_2
    :goto_0
    return-void
.end method

.method public checkAutoType(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 650
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->get(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object p1

    .line 651
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    sget v1, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    invoke-virtual {p0, p1, v0, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->checkAutoType(Ljava/lang/String;Ljava/lang/Class;I)Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method public checkAutoType(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 649
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    invoke-virtual {p0, p1, p2, v0}, Lcom/alibaba/fastjson/parser/ParserConfig;->checkAutoType(Ljava/lang/String;Ljava/lang/Class;I)Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method public checkAutoType(Ljava/lang/String;Ljava/lang/Class;I)Ljava/lang/Class;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;I)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    return-object v3

    .line 11
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    const/16 v5, 0xc0

    .line 16
    .line 17
    const-string v6, "autoType is not support. "

    .line 18
    .line 19
    if-ge v4, v5, :cond_2a

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    const/4 v5, 0x3

    .line 26
    if-lt v4, v5, :cond_2a

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    const/4 v7, 0x1

    .line 30
    if-nez v2, :cond_2

    .line 31
    .line 32
    :cond_1
    :goto_0
    move v8, v4

    .line 33
    goto :goto_1

    .line 34
    :cond_2
    const-class v8, Ljava/lang/Object;

    .line 35
    .line 36
    if-eq v2, v8, :cond_1

    .line 37
    .line 38
    const-class v8, Ljava/io/Serializable;

    .line 39
    .line 40
    if-eq v2, v8, :cond_1

    .line 41
    .line 42
    const-class v8, Ljava/lang/Cloneable;

    .line 43
    .line 44
    if-eq v2, v8, :cond_1

    .line 45
    .line 46
    const-class v8, Ljava/io/Closeable;

    .line 47
    .line 48
    if-eq v2, v8, :cond_1

    .line 49
    .line 50
    const-class v8, Ljava/util/EventListener;

    .line 51
    .line 52
    if-eq v2, v8, :cond_1

    .line 53
    .line 54
    const-class v8, Ljava/lang/Iterable;

    .line 55
    .line 56
    if-eq v2, v8, :cond_1

    .line 57
    .line 58
    const-class v8, Ljava/util/Collection;

    .line 59
    .line 60
    if-ne v2, v8, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    move v8, v7

    .line 64
    :goto_1
    const/16 v9, 0x24

    .line 65
    .line 66
    const/16 v10, 0x2e

    .line 67
    .line 68
    invoke-virtual {v1, v9, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v9

    .line 72
    invoke-virtual {v9, v4}, Ljava/lang/String;->charAt(I)C

    .line 73
    .line 74
    .line 75
    move-result v11

    .line 76
    int-to-long v11, v11

    .line 77
    const-wide v13, -0x340d631b7bdddcdbL    # -7.302176725335867E57

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    xor-long/2addr v11, v13

    .line 83
    const-wide v15, 0x100000001b3L

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    mul-long/2addr v11, v15

    .line 89
    const-wide v17, -0x509be9b379fdb0e6L    # -2.1176223865607047E-80

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    cmp-long v17, v11, v17

    .line 95
    .line 96
    if-eqz v17, :cond_29

    .line 97
    .line 98
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 99
    .line 100
    .line 101
    move-result v17

    .line 102
    move-object/from16 v18, v3

    .line 103
    .line 104
    add-int/lit8 v3, v17, -0x1

    .line 105
    .line 106
    invoke-virtual {v9, v3}, Ljava/lang/String;->charAt(I)C

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    move-wide/from16 v19, v13

    .line 111
    .line 112
    int-to-long v13, v3

    .line 113
    xor-long/2addr v11, v13

    .line 114
    mul-long/2addr v11, v15

    .line 115
    const-wide v13, 0x9198507b5af98f0L

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    cmp-long v3, v11, v13

    .line 121
    .line 122
    if-eqz v3, :cond_28

    .line 123
    .line 124
    invoke-virtual {v9, v4}, Ljava/lang/String;->charAt(I)C

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    int-to-long v11, v3

    .line 129
    xor-long v11, v11, v19

    .line 130
    .line 131
    mul-long/2addr v11, v15

    .line 132
    invoke-virtual {v9, v7}, Ljava/lang/String;->charAt(I)C

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    int-to-long v13, v3

    .line 137
    xor-long/2addr v11, v13

    .line 138
    mul-long/2addr v11, v15

    .line 139
    const/4 v3, 0x2

    .line 140
    invoke-virtual {v9, v3}, Ljava/lang/String;->charAt(I)C

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    int-to-long v13, v3

    .line 145
    xor-long/2addr v11, v13

    .line 146
    mul-long/2addr v11, v15

    .line 147
    sget-object v3, Lcom/alibaba/fastjson/parser/ParserConfig;->INTERNAL_WHITELIST_HASHCODES:[J

    .line 148
    .line 149
    invoke-static {v9}, Lcom/alibaba/fastjson/util/TypeUtils;->fnv1a_64(Ljava/lang/String;)J

    .line 150
    .line 151
    .line 152
    move-result-wide v13

    .line 153
    invoke-static {v3, v13, v14}, Ljava/util/Arrays;->binarySearch([JJ)I

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    if-ltz v3, :cond_4

    .line 158
    .line 159
    move v3, v7

    .line 160
    goto :goto_2

    .line 161
    :cond_4
    move v3, v4

    .line 162
    :goto_2
    if-nez v3, :cond_5

    .line 163
    .line 164
    iget-boolean v13, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->autoTypeSupport:Z

    .line 165
    .line 166
    if-nez v13, :cond_6

    .line 167
    .line 168
    if-eqz v8, :cond_5

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :cond_5
    move-wide/from16 v19, v15

    .line 172
    .line 173
    goto :goto_6

    .line 174
    :cond_6
    :goto_3
    move v13, v5

    .line 175
    move-wide/from16 v19, v11

    .line 176
    .line 177
    move-object/from16 v14, v18

    .line 178
    .line 179
    :goto_4
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    if-ge v13, v5, :cond_a

    .line 184
    .line 185
    invoke-virtual {v9, v13}, Ljava/lang/String;->charAt(I)C

    .line 186
    .line 187
    .line 188
    move-result v5

    .line 189
    int-to-long v4, v5

    .line 190
    xor-long v4, v19, v4

    .line 191
    .line 192
    mul-long/2addr v4, v15

    .line 193
    move-wide/from16 v19, v15

    .line 194
    .line 195
    iget-object v15, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->acceptHashCodes:[J

    .line 196
    .line 197
    invoke-static {v15, v4, v5}, Ljava/util/Arrays;->binarySearch([JJ)I

    .line 198
    .line 199
    .line 200
    move-result v15

    .line 201
    if-ltz v15, :cond_7

    .line 202
    .line 203
    iget-object v14, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->defaultClassLoader:Ljava/lang/ClassLoader;

    .line 204
    .line 205
    invoke-static {v1, v14, v7}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;Z)Ljava/lang/Class;

    .line 206
    .line 207
    .line 208
    move-result-object v14

    .line 209
    if-eqz v14, :cond_7

    .line 210
    .line 211
    return-object v14

    .line 212
    :cond_7
    iget-object v15, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->denyHashCodes:[J

    .line 213
    .line 214
    invoke-static {v15, v4, v5}, Ljava/util/Arrays;->binarySearch([JJ)I

    .line 215
    .line 216
    .line 217
    move-result v15

    .line 218
    if-ltz v15, :cond_9

    .line 219
    .line 220
    invoke-static {v1}, Lcom/alibaba/fastjson/util/TypeUtils;->getClassFromMapping(Ljava/lang/String;)Ljava/lang/Class;

    .line 221
    .line 222
    .line 223
    move-result-object v15

    .line 224
    if-eqz v15, :cond_8

    .line 225
    .line 226
    goto :goto_5

    .line 227
    :cond_8
    invoke-virtual {v6, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    return-object v18

    .line 235
    :cond_9
    :goto_5
    add-int/lit8 v13, v13, 0x1

    .line 236
    .line 237
    move-wide/from16 v15, v19

    .line 238
    .line 239
    move-wide/from16 v19, v4

    .line 240
    .line 241
    const/4 v4, 0x0

    .line 242
    goto :goto_4

    .line 243
    :cond_a
    move-wide/from16 v19, v15

    .line 244
    .line 245
    goto :goto_7

    .line 246
    :goto_6
    move-object/from16 v14, v18

    .line 247
    .line 248
    :goto_7
    if-nez v14, :cond_b

    .line 249
    .line 250
    invoke-static {v1}, Lcom/alibaba/fastjson/util/TypeUtils;->getClassFromMapping(Ljava/lang/String;)Ljava/lang/Class;

    .line 251
    .line 252
    .line 253
    move-result-object v14

    .line 254
    :cond_b
    if-nez v14, :cond_c

    .line 255
    .line 256
    iget-object v4, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 257
    .line 258
    invoke-virtual {v4, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->findClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 259
    .line 260
    .line 261
    move-result-object v14

    .line 262
    :cond_c
    if-nez v14, :cond_d

    .line 263
    .line 264
    iget-object v4, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->typeMapping:Ljava/util/concurrent/ConcurrentMap;

    .line 265
    .line 266
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object v4

    .line 270
    move-object v14, v4

    .line 271
    check-cast v14, Ljava/lang/Class;

    .line 272
    .line 273
    :cond_d
    if-eqz v3, :cond_e

    .line 274
    .line 275
    iget-object v3, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->defaultClassLoader:Ljava/lang/ClassLoader;

    .line 276
    .line 277
    invoke-static {v1, v3, v7}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;Z)Ljava/lang/Class;

    .line 278
    .line 279
    .line 280
    move-result-object v14

    .line 281
    :cond_e
    const-string v3, " -> "

    .line 282
    .line 283
    const-string v4, "type not match. "

    .line 284
    .line 285
    if-eqz v14, :cond_11

    .line 286
    .line 287
    if-eqz v2, :cond_10

    .line 288
    .line 289
    const-class v0, Ljava/util/HashMap;

    .line 290
    .line 291
    if-eq v14, v0, :cond_10

    .line 292
    .line 293
    invoke-virtual {v2, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    if-eqz v0, :cond_f

    .line 298
    .line 299
    goto :goto_8

    .line 300
    :cond_f
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    invoke-static {v4, v1, v3, v0}, Ll/pg60;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 305
    .line 306
    .line 307
    return-object v18

    .line 308
    :cond_10
    :goto_8
    return-object v14

    .line 309
    :cond_11
    iget-boolean v5, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->autoTypeSupport:Z

    .line 310
    .line 311
    if-nez v5, :cond_17

    .line 312
    .line 313
    const/4 v5, 0x3

    .line 314
    :goto_9
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 315
    .line 316
    .line 317
    move-result v13

    .line 318
    if-ge v5, v13, :cond_17

    .line 319
    .line 320
    invoke-virtual {v9, v5}, Ljava/lang/String;->charAt(I)C

    .line 321
    .line 322
    .line 323
    move-result v13

    .line 324
    move-wide/from16 v16, v11

    .line 325
    .line 326
    int-to-long v10, v13

    .line 327
    xor-long v10, v16, v10

    .line 328
    .line 329
    mul-long v11, v10, v19

    .line 330
    .line 331
    iget-object v10, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->denyHashCodes:[J

    .line 332
    .line 333
    invoke-static {v10, v11, v12}, Ljava/util/Arrays;->binarySearch([JJ)I

    .line 334
    .line 335
    .line 336
    move-result v10

    .line 337
    if-gez v10, :cond_16

    .line 338
    .line 339
    iget-object v10, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->acceptHashCodes:[J

    .line 340
    .line 341
    invoke-static {v10, v11, v12}, Ljava/util/Arrays;->binarySearch([JJ)I

    .line 342
    .line 343
    .line 344
    move-result v10

    .line 345
    if-ltz v10, :cond_15

    .line 346
    .line 347
    if-nez v14, :cond_12

    .line 348
    .line 349
    iget-object v0, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->defaultClassLoader:Ljava/lang/ClassLoader;

    .line 350
    .line 351
    invoke-static {v1, v0, v7}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;Z)Ljava/lang/Class;

    .line 352
    .line 353
    .line 354
    move-result-object v14

    .line 355
    :cond_12
    if-eqz v2, :cond_14

    .line 356
    .line 357
    invoke-virtual {v2, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 358
    .line 359
    .line 360
    move-result v0

    .line 361
    if-nez v0, :cond_13

    .line 362
    .line 363
    goto :goto_a

    .line 364
    :cond_13
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    invoke-static {v4, v1, v3, v0}, Ll/pg60;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 369
    .line 370
    .line 371
    return-object v18

    .line 372
    :cond_14
    :goto_a
    return-object v14

    .line 373
    :cond_15
    add-int/lit8 v5, v5, 0x1

    .line 374
    .line 375
    const/16 v10, 0x2e

    .line 376
    .line 377
    goto :goto_9

    .line 378
    :cond_16
    invoke-virtual {v6, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 383
    .line 384
    .line 385
    return-object v18

    .line 386
    :cond_17
    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    .line 387
    .line 388
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 389
    .line 390
    .line 391
    const/16 v9, 0x2f

    .line 392
    .line 393
    const/16 v15, 0x2e

    .line 394
    .line 395
    invoke-virtual {v1, v15, v9}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v9

    .line 399
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    .line 401
    .line 402
    const-string v9, ".class"

    .line 403
    .line 404
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    .line 406
    .line 407
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object v5

    .line 411
    iget-object v9, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->defaultClassLoader:Ljava/lang/ClassLoader;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 412
    .line 413
    if-eqz v9, :cond_18

    .line 414
    .line 415
    :try_start_1
    invoke-virtual {v9, v5}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    .line 416
    .line 417
    .line 418
    move-result-object v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 419
    goto :goto_b

    .line 420
    :catchall_0
    move-exception v0

    .line 421
    move-object/from16 v3, v18

    .line 422
    .line 423
    goto :goto_d

    .line 424
    :catch_0
    move-object/from16 v5, v18

    .line 425
    .line 426
    :catch_1
    const/4 v12, 0x0

    .line 427
    goto :goto_e

    .line 428
    :cond_18
    :try_start_2
    const-class v9, Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 429
    .line 430
    invoke-virtual {v9}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 431
    .line 432
    .line 433
    move-result-object v9

    .line 434
    invoke-virtual {v9, v5}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    .line 435
    .line 436
    .line 437
    move-result-object v5
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 438
    :goto_b
    if-eqz v5, :cond_19

    .line 439
    .line 440
    :try_start_3
    new-instance v9, Lcom/alibaba/fastjson/asm/ClassReader;

    .line 441
    .line 442
    invoke-direct {v9, v5, v7}, Lcom/alibaba/fastjson/asm/ClassReader;-><init>(Ljava/io/InputStream;Z)V

    .line 443
    .line 444
    .line 445
    new-instance v10, Lcom/alibaba/fastjson/asm/TypeCollector;

    .line 446
    .line 447
    const-string v11, "<clinit>"
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 448
    .line 449
    const/4 v12, 0x0

    .line 450
    :try_start_4
    new-array v13, v12, [Ljava/lang/Class;

    .line 451
    .line 452
    invoke-direct {v10, v11, v13}, Lcom/alibaba/fastjson/asm/TypeCollector;-><init>(Ljava/lang/String;[Ljava/lang/Class;)V

    .line 453
    .line 454
    .line 455
    invoke-virtual {v9, v10}, Lcom/alibaba/fastjson/asm/ClassReader;->accept(Lcom/alibaba/fastjson/asm/TypeCollector;)V

    .line 456
    .line 457
    .line 458
    invoke-virtual {v10}, Lcom/alibaba/fastjson/asm/TypeCollector;->hasJsonType()Z

    .line 459
    .line 460
    .line 461
    move-result v9
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 462
    goto :goto_c

    .line 463
    :catchall_1
    move-exception v0

    .line 464
    move-object v3, v5

    .line 465
    goto :goto_d

    .line 466
    :cond_19
    const/4 v12, 0x0

    .line 467
    move v9, v12

    .line 468
    :goto_c
    invoke-static {v5}, Lcom/alibaba/fastjson/util/IOUtils;->close(Ljava/io/Closeable;)V

    .line 469
    .line 470
    .line 471
    goto :goto_f

    .line 472
    :catch_2
    const/4 v12, 0x0

    .line 473
    move-object/from16 v5, v18

    .line 474
    .line 475
    goto :goto_e

    .line 476
    :goto_d
    invoke-static {v3}, Lcom/alibaba/fastjson/util/IOUtils;->close(Ljava/io/Closeable;)V

    .line 477
    .line 478
    .line 479
    throw v0

    .line 480
    :catch_3
    :goto_e
    invoke-static {v5}, Lcom/alibaba/fastjson/util/IOUtils;->close(Ljava/io/Closeable;)V

    .line 481
    .line 482
    .line 483
    move v9, v12

    .line 484
    :goto_f
    sget-object v5, Lcom/alibaba/fastjson/parser/Feature;->SupportAutoType:Lcom/alibaba/fastjson/parser/Feature;

    .line 485
    .line 486
    iget v5, v5, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    .line 487
    .line 488
    iget-boolean v10, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->autoTypeSupport:Z

    .line 489
    .line 490
    if-nez v10, :cond_1b

    .line 491
    .line 492
    and-int v10, p3, v5

    .line 493
    .line 494
    if-nez v10, :cond_1b

    .line 495
    .line 496
    sget v10, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    .line 497
    .line 498
    and-int/2addr v5, v10

    .line 499
    if-eqz v5, :cond_1a

    .line 500
    .line 501
    goto :goto_10

    .line 502
    :cond_1a
    move v5, v12

    .line 503
    goto :goto_11

    .line 504
    :cond_1b
    :goto_10
    move v5, v7

    .line 505
    :goto_11
    if-nez v14, :cond_1f

    .line 506
    .line 507
    if-nez v5, :cond_1c

    .line 508
    .line 509
    if-nez v9, :cond_1c

    .line 510
    .line 511
    if-eqz v8, :cond_1f

    .line 512
    .line 513
    :cond_1c
    if-nez v5, :cond_1d

    .line 514
    .line 515
    if-eqz v9, :cond_1e

    .line 516
    .line 517
    :cond_1d
    move v12, v7

    .line 518
    :cond_1e
    iget-object v7, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->defaultClassLoader:Ljava/lang/ClassLoader;

    .line 519
    .line 520
    invoke-static {v1, v7, v12}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;Z)Ljava/lang/Class;

    .line 521
    .line 522
    .line 523
    move-result-object v14

    .line 524
    :cond_1f
    if-eqz v14, :cond_25

    .line 525
    .line 526
    if-eqz v9, :cond_20

    .line 527
    .line 528
    invoke-static {v1, v14}, Lcom/alibaba/fastjson/util/TypeUtils;->addMapping(Ljava/lang/String;Ljava/lang/Class;)V

    .line 529
    .line 530
    .line 531
    return-object v14

    .line 532
    :cond_20
    const-class v7, Ljava/lang/ClassLoader;

    .line 533
    .line 534
    invoke-virtual {v7, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 535
    .line 536
    .line 537
    move-result v7

    .line 538
    if-nez v7, :cond_24

    .line 539
    .line 540
    const-class v7, Ljavax/sql/DataSource;

    .line 541
    .line 542
    invoke-virtual {v7, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 543
    .line 544
    .line 545
    move-result v7

    .line 546
    if-nez v7, :cond_24

    .line 547
    .line 548
    const-class v7, Ljavax/sql/RowSet;

    .line 549
    .line 550
    invoke-virtual {v7, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 551
    .line 552
    .line 553
    move-result v7

    .line 554
    if-nez v7, :cond_24

    .line 555
    .line 556
    if-eqz v2, :cond_22

    .line 557
    .line 558
    invoke-virtual {v2, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 559
    .line 560
    .line 561
    move-result v0

    .line 562
    if-eqz v0, :cond_21

    .line 563
    .line 564
    invoke-static {v1, v14}, Lcom/alibaba/fastjson/util/TypeUtils;->addMapping(Ljava/lang/String;Ljava/lang/Class;)V

    .line 565
    .line 566
    .line 567
    return-object v14

    .line 568
    :cond_21
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 569
    .line 570
    .line 571
    move-result-object v0

    .line 572
    invoke-static {v4, v1, v3, v0}, Ll/pg60;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 573
    .line 574
    .line 575
    return-object v18

    .line 576
    :cond_22
    iget-object v0, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->propertyNamingStrategy:Lcom/alibaba/fastjson/PropertyNamingStrategy;

    .line 577
    .line 578
    invoke-static {v14, v14, v0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->build(Ljava/lang/Class;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/PropertyNamingStrategy;)Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 579
    .line 580
    .line 581
    move-result-object v0

    .line 582
    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    .line 583
    .line 584
    if-eqz v0, :cond_25

    .line 585
    .line 586
    if-nez v5, :cond_23

    .line 587
    .line 588
    goto :goto_12

    .line 589
    :cond_23
    invoke-virtual {v6, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 590
    .line 591
    .line 592
    move-result-object v0

    .line 593
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 594
    .line 595
    .line 596
    return-object v18

    .line 597
    :cond_24
    invoke-virtual {v6, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 598
    .line 599
    .line 600
    move-result-object v0

    .line 601
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 602
    .line 603
    .line 604
    return-object v18

    .line 605
    :cond_25
    :goto_12
    if-eqz v5, :cond_27

    .line 606
    .line 607
    if-eqz v14, :cond_26

    .line 608
    .line 609
    invoke-static {v1, v14}, Lcom/alibaba/fastjson/util/TypeUtils;->addMapping(Ljava/lang/String;Ljava/lang/Class;)V

    .line 610
    .line 611
    .line 612
    :cond_26
    return-object v14

    .line 613
    :cond_27
    invoke-virtual {v6, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 614
    .line 615
    .line 616
    move-result-object v0

    .line 617
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 618
    .line 619
    .line 620
    return-object v18

    .line 621
    :cond_28
    invoke-virtual {v6, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 622
    .line 623
    .line 624
    move-result-object v0

    .line 625
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 626
    .line 627
    .line 628
    return-object v18

    .line 629
    :cond_29
    move-object/from16 v18, v3

    .line 630
    .line 631
    invoke-virtual {v6, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 632
    .line 633
    .line 634
    move-result-object v0

    .line 635
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 636
    .line 637
    .line 638
    return-object v18

    .line 639
    :cond_2a
    move-object/from16 v18, v3

    .line 640
    .line 641
    invoke-virtual {v6, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 642
    .line 643
    .line 644
    move-result-object v0

    .line 645
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 646
    .line 647
    .line 648
    return-object v18
.end method

.method public clearDeserializers()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/alibaba/fastjson/util/IdentityHashMap;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/alibaba/fastjson/parser/ParserConfig;->initDeserializers()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public configFromPropety(Ljava/util/Properties;)V
    .locals 1

    .line 1
    const-string v0, "fastjson.parser.deny"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/ParserConfig;->splitItemsFormProperty(Ljava/lang/String;)[Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/parser/ParserConfig;->addItemsToDeny([Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "fastjson.parser.autoTypeAccept"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/ParserConfig;->splitItemsFormProperty(Ljava/lang/String;)[Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/parser/ParserConfig;->addItemsToAccept([Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const-string v0, "fastjson.parser.autoTypeSupport"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string v0, "true"

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    iput-boolean p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->autoTypeSupport:Z

    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    const-string v0, "false"

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    iput-boolean p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->autoTypeSupport:Z

    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public createFieldDeserializer(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;Lcom/alibaba/fastjson/util/FieldInfo;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .locals 3

    .line 1
    iget-object p0, p2, Lcom/alibaba/fastjson/util/JavaBeanInfo;->clazz:Ljava/lang/Class;

    .line 2
    .line 3
    iget-object p2, p3, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/alibaba/fastjson/util/FieldInfo;->getAnnotation()Lcom/alibaba/fastjson/annotation/JSONField;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->deserializeUsing()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-class v2, Ljava/lang/Void;

    .line 17
    .line 18
    if-ne v0, v2, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move-object v1, v0

    .line 22
    :cond_1
    :goto_0
    if-nez v1, :cond_3

    .line 23
    .line 24
    const-class v0, Ljava/util/List;

    .line 25
    .line 26
    if-eq p2, v0, :cond_2

    .line 27
    .line 28
    const-class v0, Ljava/util/ArrayList;

    .line 29
    .line 30
    if-ne p2, v0, :cond_3

    .line 31
    .line 32
    :cond_2
    new-instance p2, Lcom/alibaba/fastjson/parser/deserializer/ArrayListTypeFieldDeserializer;

    .line 33
    .line 34
    invoke-direct {p2, p1, p0, p3}, Lcom/alibaba/fastjson/parser/deserializer/ArrayListTypeFieldDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 35
    .line 36
    .line 37
    return-object p2

    .line 38
    :cond_3
    new-instance p2, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;

    .line 39
    .line 40
    invoke-direct {p2, p1, p0, p3}, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 41
    .line 42
    .line 43
    return-object p2
.end method

.method public createJavaBeanDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmEnable:Z

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->fieldBased:Z

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    xor-int/2addr v1, v2

    .line 7
    and-int/2addr v0, v1

    .line 8
    const-class v1, Ljava/lang/Void;

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    if-eqz v0, :cond_4

    .line 12
    .line 13
    const-class v4, Lcom/alibaba/fastjson/annotation/JSONType;

    .line 14
    .line 15
    invoke-static {p1, v4}, Lcom/alibaba/fastjson/util/TypeUtils;->getAnnotation(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    check-cast v4, Lcom/alibaba/fastjson/annotation/JSONType;

    .line 20
    .line 21
    if-eqz v4, :cond_1

    .line 22
    .line 23
    invoke-interface {v4}, Lcom/alibaba/fastjson/annotation/JSONType;->deserializer()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eq v0, v1, :cond_0

    .line 28
    .line 29
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    instance-of v5, v0, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 34
    .line 35
    if-eqz v5, :cond_0

    .line 36
    .line 37
    check-cast v0, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    return-object v0

    .line 40
    :catchall_0
    :cond_0
    invoke-interface {v4}, Lcom/alibaba/fastjson/annotation/JSONType;->asm()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    :cond_1
    if-eqz v0, :cond_4

    .line 45
    .line 46
    invoke-static {p1, v4}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->getBuilderClass(Ljava/lang/Class;Lcom/alibaba/fastjson/annotation/JSONType;)Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    if-nez v4, :cond_2

    .line 51
    .line 52
    move-object v4, p1

    .line 53
    :cond_2
    invoke-virtual {v4}, Ljava/lang/Class;->getModifiers()I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    if-nez v5, :cond_3

    .line 62
    .line 63
    move v0, v3

    .line 64
    goto :goto_0

    .line 65
    :cond_3
    invoke-virtual {v4}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    const-class v5, Ljava/lang/Object;

    .line 70
    .line 71
    if-eq v4, v5, :cond_4

    .line 72
    .line 73
    if-nez v4, :cond_2

    .line 74
    .line 75
    :cond_4
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    array-length v4, v4

    .line 80
    if-eqz v4, :cond_5

    .line 81
    .line 82
    move v0, v3

    .line 83
    :cond_5
    if-eqz v0, :cond_6

    .line 84
    .line 85
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmFactory:Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;

    .line 86
    .line 87
    if-eqz v4, :cond_6

    .line 88
    .line 89
    iget-object v4, v4, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;->classLoader:Lcom/alibaba/fastjson/util/ASMClassLoader;

    .line 90
    .line 91
    invoke-virtual {v4, p1}, Lcom/alibaba/fastjson/util/ASMClassLoader;->isExternalClass(Ljava/lang/Class;)Z

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    if-eqz v4, :cond_6

    .line 96
    .line 97
    move v0, v3

    .line 98
    :cond_6
    if-eqz v0, :cond_7

    .line 99
    .line 100
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-static {v0}, Lcom/alibaba/fastjson/util/ASMUtils;->checkName(Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    :cond_7
    if-eqz v0, :cond_13

    .line 109
    .line 110
    invoke-virtual {p1}, Ljava/lang/Class;->isInterface()Z

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    if-eqz v4, :cond_8

    .line 115
    .line 116
    move v0, v3

    .line 117
    :cond_8
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->propertyNamingStrategy:Lcom/alibaba/fastjson/PropertyNamingStrategy;

    .line 118
    .line 119
    sget-boolean v8, Lcom/alibaba/fastjson/util/TypeUtils;->compatibleWithJavaBean:Z

    .line 120
    .line 121
    iget-boolean v9, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->jacksonCompatible:Z

    .line 122
    .line 123
    const/4 v7, 0x0

    .line 124
    move-object v4, p1

    .line 125
    move-object v5, p2

    .line 126
    invoke-static/range {v4 .. v9}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->build(Ljava/lang/Class;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/PropertyNamingStrategy;ZZZ)Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    if-eqz v0, :cond_9

    .line 131
    .line 132
    iget-object p2, p1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 133
    .line 134
    array-length p2, p2

    .line 135
    const/16 v6, 0xc8

    .line 136
    .line 137
    if-le p2, v6, :cond_9

    .line 138
    .line 139
    move v0, v3

    .line 140
    :cond_9
    iget-object p2, p1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->defaultConstructor:Ljava/lang/reflect/Constructor;

    .line 141
    .line 142
    if-eqz v0, :cond_a

    .line 143
    .line 144
    if-nez p2, :cond_a

    .line 145
    .line 146
    invoke-virtual {v4}, Ljava/lang/Class;->isInterface()Z

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    if-nez p2, :cond_a

    .line 151
    .line 152
    move v0, v3

    .line 153
    :cond_a
    iget-object p1, p1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 154
    .line 155
    array-length p2, p1

    .line 156
    move v6, v3

    .line 157
    :goto_1
    if-ge v6, p2, :cond_14

    .line 158
    .line 159
    aget-object v7, p1, v6

    .line 160
    .line 161
    iget-boolean v8, v7, Lcom/alibaba/fastjson/util/FieldInfo;->getOnly:Z

    .line 162
    .line 163
    if-eqz v8, :cond_c

    .line 164
    .line 165
    :cond_b
    :goto_2
    move v0, v3

    .line 166
    goto/16 :goto_3

    .line 167
    .line 168
    :cond_c
    iget-object v8, v7, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 169
    .line 170
    invoke-virtual {v8}, Ljava/lang/Class;->getModifiers()I

    .line 171
    .line 172
    .line 173
    move-result v9

    .line 174
    invoke-static {v9}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    .line 175
    .line 176
    .line 177
    move-result v9

    .line 178
    if-nez v9, :cond_d

    .line 179
    .line 180
    goto :goto_2

    .line 181
    :cond_d
    invoke-virtual {v8}, Ljava/lang/Class;->isMemberClass()Z

    .line 182
    .line 183
    .line 184
    move-result v9

    .line 185
    if-eqz v9, :cond_e

    .line 186
    .line 187
    invoke-virtual {v8}, Ljava/lang/Class;->getModifiers()I

    .line 188
    .line 189
    .line 190
    move-result v9

    .line 191
    invoke-static {v9}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    .line 192
    .line 193
    .line 194
    move-result v9

    .line 195
    if-nez v9, :cond_e

    .line 196
    .line 197
    goto :goto_2

    .line 198
    :cond_e
    invoke-virtual {v7}, Lcom/alibaba/fastjson/util/FieldInfo;->getMember()Ljava/lang/reflect/Member;

    .line 199
    .line 200
    .line 201
    move-result-object v9

    .line 202
    if-eqz v9, :cond_f

    .line 203
    .line 204
    invoke-virtual {v7}, Lcom/alibaba/fastjson/util/FieldInfo;->getMember()Ljava/lang/reflect/Member;

    .line 205
    .line 206
    .line 207
    move-result-object v9

    .line 208
    invoke-interface {v9}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v9

    .line 212
    invoke-static {v9}, Lcom/alibaba/fastjson/util/ASMUtils;->checkName(Ljava/lang/String;)Z

    .line 213
    .line 214
    .line 215
    move-result v9

    .line 216
    if-nez v9, :cond_f

    .line 217
    .line 218
    goto :goto_2

    .line 219
    :cond_f
    invoke-virtual {v7}, Lcom/alibaba/fastjson/util/FieldInfo;->getAnnotation()Lcom/alibaba/fastjson/annotation/JSONField;

    .line 220
    .line 221
    .line 222
    move-result-object v9

    .line 223
    if-eqz v9, :cond_10

    .line 224
    .line 225
    invoke-interface {v9}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v10

    .line 229
    invoke-static {v10}, Lcom/alibaba/fastjson/util/ASMUtils;->checkName(Ljava/lang/String;)Z

    .line 230
    .line 231
    .line 232
    move-result v10

    .line 233
    if-eqz v10, :cond_b

    .line 234
    .line 235
    invoke-interface {v9}, Lcom/alibaba/fastjson/annotation/JSONField;->format()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v10

    .line 239
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 240
    .line 241
    .line 242
    move-result v10

    .line 243
    if-nez v10, :cond_b

    .line 244
    .line 245
    invoke-interface {v9}, Lcom/alibaba/fastjson/annotation/JSONField;->deserializeUsing()Ljava/lang/Class;

    .line 246
    .line 247
    .line 248
    move-result-object v10

    .line 249
    if-ne v10, v1, :cond_b

    .line 250
    .line 251
    invoke-interface {v9}, Lcom/alibaba/fastjson/annotation/JSONField;->parseFeatures()[Lcom/alibaba/fastjson/parser/Feature;

    .line 252
    .line 253
    .line 254
    move-result-object v10

    .line 255
    array-length v10, v10

    .line 256
    if-nez v10, :cond_b

    .line 257
    .line 258
    invoke-interface {v9}, Lcom/alibaba/fastjson/annotation/JSONField;->unwrapped()Z

    .line 259
    .line 260
    .line 261
    move-result v9

    .line 262
    if-nez v9, :cond_b

    .line 263
    .line 264
    :cond_10
    iget-object v7, v7, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    .line 265
    .line 266
    if-eqz v7, :cond_11

    .line 267
    .line 268
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    .line 269
    .line 270
    .line 271
    move-result-object v7

    .line 272
    array-length v7, v7

    .line 273
    if-le v7, v2, :cond_11

    .line 274
    .line 275
    goto :goto_2

    .line 276
    :cond_11
    invoke-virtual {v8}, Ljava/lang/Class;->isEnum()Z

    .line 277
    .line 278
    .line 279
    move-result v7

    .line 280
    if-eqz v7, :cond_12

    .line 281
    .line 282
    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 283
    .line 284
    .line 285
    move-result-object v7

    .line 286
    instance-of v7, v7, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;

    .line 287
    .line 288
    if-nez v7, :cond_12

    .line 289
    .line 290
    goto :goto_2

    .line 291
    :cond_12
    add-int/lit8 v6, v6, 0x1

    .line 292
    .line 293
    goto/16 :goto_1

    .line 294
    .line 295
    :cond_13
    move-object v4, p1

    .line 296
    move-object v5, p2

    .line 297
    :cond_14
    :goto_3
    if-eqz v0, :cond_15

    .line 298
    .line 299
    invoke-virtual {v4}, Ljava/lang/Class;->isMemberClass()Z

    .line 300
    .line 301
    .line 302
    move-result p1

    .line 303
    if-eqz p1, :cond_15

    .line 304
    .line 305
    invoke-virtual {v4}, Ljava/lang/Class;->getModifiers()I

    .line 306
    .line 307
    .line 308
    move-result p1

    .line 309
    invoke-static {p1}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    .line 310
    .line 311
    .line 312
    move-result p1

    .line 313
    if-nez p1, :cond_15

    .line 314
    .line 315
    move v0, v3

    .line 316
    :cond_15
    if-eqz v0, :cond_16

    .line 317
    .line 318
    invoke-static {v4}, Lcom/alibaba/fastjson/util/TypeUtils;->isXmlField(Ljava/lang/Class;)Z

    .line 319
    .line 320
    .line 321
    move-result p1

    .line 322
    if-eqz p1, :cond_16

    .line 323
    .line 324
    goto :goto_4

    .line 325
    :cond_16
    move v3, v0

    .line 326
    :goto_4
    if-nez v3, :cond_17

    .line 327
    .line 328
    new-instance p1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 329
    .line 330
    invoke-direct {p1, p0, v4, v5}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Ljava/lang/reflect/Type;)V

    .line 331
    .line 332
    .line 333
    return-object p1

    .line 334
    :cond_17
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->propertyNamingStrategy:Lcom/alibaba/fastjson/PropertyNamingStrategy;

    .line 335
    .line 336
    invoke-static {v4, v5, p1}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->build(Ljava/lang/Class;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/PropertyNamingStrategy;)Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 337
    .line 338
    .line 339
    move-result-object p1

    .line 340
    :try_start_1
    iget-object p2, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmFactory:Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;

    .line 341
    .line 342
    invoke-virtual {p2, p0, p1}, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;->createJavaBeanDeserializer(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 343
    .line 344
    .line 345
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lcom/alibaba/fastjson/JSONException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 346
    return-object p0

    .line 347
    :catch_0
    move-exception v0

    .line 348
    move-object p0, v0

    .line 349
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object p1

    .line 353
    const-string p2, "create asm deserializer error, "

    .line 354
    .line 355
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object p1

    .line 359
    invoke-static {p1, p0}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 360
    .line 361
    .line 362
    const/4 p0, 0x0

    .line 363
    return-object p0

    .line 364
    :catch_1
    new-instance p2, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 365
    .line 366
    invoke-direct {p2, p0, p1}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;)V

    .line 367
    .line 368
    .line 369
    return-object p2

    .line 370
    :catch_2
    new-instance p1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 371
    .line 372
    invoke-direct {p1, p0, v4, v5}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Ljava/lang/reflect/Type;)V

    .line 373
    .line 374
    .line 375
    return-object p1
.end method

.method public get(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/alibaba/fastjson/JSON;->getMixInAnnotations(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->mixInDeserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 23
    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0

    .line 28
    :cond_1
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 33
    .line 34
    return-object p0
.end method

.method public getDefaultClassLoader()Ljava/lang/ClassLoader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->defaultClassLoader:Ljava/lang/ClassLoader;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDerializers()Lcom/alibaba/fastjson/util/IdentityHashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/alibaba/fastjson/util/IdentityHashMap<",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDeserializer(Lcom/alibaba/fastjson/util/FieldInfo;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .locals 1

    .line 678
    iget-object v0, p1, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    iget-object p1, p1, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    invoke-virtual {p0, v0, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object p0

    return-object p0
.end method

.method public getDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .locals 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    const-string v3, "java.util.Optional"

    .line 8
    .line 9
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/ParserConfig;->get(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    if-eqz v4, :cond_0

    .line 14
    .line 15
    return-object v4

    .line 16
    :cond_0
    if-nez v2, :cond_1

    .line 17
    .line 18
    move-object v2, v1

    .line 19
    :cond_1
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/ParserConfig;->get(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    if-eqz v4, :cond_2

    .line 24
    .line 25
    return-object v4

    .line 26
    :cond_2
    const-class v5, Lcom/alibaba/fastjson/annotation/JSONType;

    .line 27
    .line 28
    invoke-static {v1, v5}, Lcom/alibaba/fastjson/util/TypeUtils;->getAnnotation(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    check-cast v6, Lcom/alibaba/fastjson/annotation/JSONType;

    .line 33
    .line 34
    if-eqz v6, :cond_3

    .line 35
    .line 36
    invoke-interface {v6}, Lcom/alibaba/fastjson/annotation/JSONType;->mappingTo()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    const-class v7, Ljava/lang/Void;

    .line 41
    .line 42
    if-eq v6, v7, :cond_3

    .line 43
    .line 44
    invoke-virtual {v0, v6, v6}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    return-object v0

    .line 49
    :cond_3
    instance-of v6, v2, Ljava/lang/reflect/WildcardType;

    .line 50
    .line 51
    if-nez v6, :cond_4

    .line 52
    .line 53
    instance-of v6, v2, Ljava/lang/reflect/TypeVariable;

    .line 54
    .line 55
    if-nez v6, :cond_4

    .line 56
    .line 57
    instance-of v6, v2, Ljava/lang/reflect/ParameterizedType;

    .line 58
    .line 59
    if-eqz v6, :cond_5

    .line 60
    .line 61
    :cond_4
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->get(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    :cond_5
    if-eqz v4, :cond_6

    .line 66
    .line 67
    return-object v4

    .line 68
    :cond_6
    iget-object v6, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->modules:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    :cond_7
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    if-eqz v7, :cond_8

    .line 79
    .line 80
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    check-cast v4, Lcom/alibaba/fastjson/spi/Module;

    .line 85
    .line 86
    invoke-interface {v4, v0, v1}, Lcom/alibaba/fastjson/spi/Module;->createDeserializer(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    if-eqz v4, :cond_7

    .line 91
    .line 92
    invoke-virtual {v0, v2, v4}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V

    .line 93
    .line 94
    .line 95
    return-object v4

    .line 96
    :cond_8
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    const/16 v7, 0x24

    .line 101
    .line 102
    const/16 v8, 0x2e

    .line 103
    .line 104
    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    const-string v7, "java.awt."

    .line 109
    .line 110
    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result v7

    .line 114
    const/4 v8, 0x4

    .line 115
    const/4 v9, 0x0

    .line 116
    const/4 v10, 0x1

    .line 117
    if-eqz v7, :cond_b

    .line 118
    .line 119
    invoke-static {v1}, Lcom/alibaba/fastjson/serializer/AwtCodec;->support(Ljava/lang/Class;)Z

    .line 120
    .line 121
    .line 122
    move-result v7

    .line 123
    if-eqz v7, :cond_b

    .line 124
    .line 125
    sget-boolean v7, Lcom/alibaba/fastjson/parser/ParserConfig;->awtError:Z

    .line 126
    .line 127
    if-nez v7, :cond_b

    .line 128
    .line 129
    const-string v4, "java.awt.Rectangle"

    .line 130
    .line 131
    const-string v7, "java.awt.Color"

    .line 132
    .line 133
    const-string v11, "java.awt.Point"

    .line 134
    .line 135
    const-string v12, "java.awt.Font"

    .line 136
    .line 137
    filled-new-array {v11, v12, v4, v7}, [Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    move v7, v9

    .line 142
    :goto_0
    if-ge v7, v8, :cond_a

    .line 143
    .line 144
    :try_start_0
    aget-object v11, v4, v7

    .line 145
    .line 146
    invoke-virtual {v11, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v12

    .line 150
    if-eqz v12, :cond_9

    .line 151
    .line 152
    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    sget-object v7, Lcom/alibaba/fastjson/serializer/AwtCodec;->instance:Lcom/alibaba/fastjson/serializer/AwtCodec;

    .line 157
    .line 158
    invoke-virtual {v0, v4, v7}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 159
    .line 160
    .line 161
    return-object v7

    .line 162
    :cond_9
    add-int/lit8 v7, v7, 0x1

    .line 163
    .line 164
    goto :goto_0

    .line 165
    :catchall_0
    sput-boolean v10, Lcom/alibaba/fastjson/parser/ParserConfig;->awtError:Z

    .line 166
    .line 167
    :cond_a
    sget-object v4, Lcom/alibaba/fastjson/serializer/AwtCodec;->instance:Lcom/alibaba/fastjson/serializer/AwtCodec;

    .line 168
    .line 169
    :cond_b
    sget-boolean v7, Lcom/alibaba/fastjson/parser/ParserConfig;->jdk8Error:Z

    .line 170
    .line 171
    if-nez v7, :cond_f

    .line 172
    .line 173
    :try_start_1
    const-string v7, "java.time."

    .line 174
    .line 175
    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 176
    .line 177
    .line 178
    move-result v7

    .line 179
    if-eqz v7, :cond_d

    .line 180
    .line 181
    const-string v11, "java.time.LocalDateTime"

    .line 182
    .line 183
    const-string v12, "java.time.LocalDate"

    .line 184
    .line 185
    const-string v13, "java.time.LocalTime"

    .line 186
    .line 187
    const-string v14, "java.time.ZonedDateTime"

    .line 188
    .line 189
    const-string v15, "java.time.OffsetDateTime"

    .line 190
    .line 191
    const-string v16, "java.time.OffsetTime"

    .line 192
    .line 193
    const-string v17, "java.time.ZoneOffset"

    .line 194
    .line 195
    const-string v18, "java.time.ZoneRegion"

    .line 196
    .line 197
    const-string v19, "java.time.ZoneId"

    .line 198
    .line 199
    const-string v20, "java.time.Period"

    .line 200
    .line 201
    const-string v21, "java.time.Duration"

    .line 202
    .line 203
    const-string v22, "java.time.Instant"

    .line 204
    .line 205
    filled-new-array/range {v11 .. v22}, [Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    move v7, v9

    .line 210
    :goto_1
    const/16 v8, 0xc

    .line 211
    .line 212
    if-ge v7, v8, :cond_f

    .line 213
    .line 214
    aget-object v8, v3, v7

    .line 215
    .line 216
    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result v11

    .line 220
    if-eqz v11, :cond_c

    .line 221
    .line 222
    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    sget-object v4, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    .line 227
    .line 228
    invoke-virtual {v0, v3, v4}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V

    .line 229
    .line 230
    .line 231
    return-object v4

    .line 232
    :cond_c
    add-int/lit8 v7, v7, 0x1

    .line 233
    .line 234
    goto :goto_1

    .line 235
    :cond_d
    invoke-virtual {v6, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 236
    .line 237
    .line 238
    move-result v7

    .line 239
    if-eqz v7, :cond_f

    .line 240
    .line 241
    const-string v7, "java.util.OptionalDouble"

    .line 242
    .line 243
    const-string v11, "java.util.OptionalInt"

    .line 244
    .line 245
    const-string v12, "java.util.OptionalLong"

    .line 246
    .line 247
    filled-new-array {v3, v7, v11, v12}, [Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    move v7, v9

    .line 252
    :goto_2
    if-ge v7, v8, :cond_f

    .line 253
    .line 254
    aget-object v11, v3, v7

    .line 255
    .line 256
    invoke-virtual {v11, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v12

    .line 260
    if-eqz v12, :cond_e

    .line 261
    .line 262
    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 263
    .line 264
    .line 265
    move-result-object v3

    .line 266
    sget-object v4, Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;

    .line 267
    .line 268
    invoke-virtual {v0, v3, v4}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 269
    .line 270
    .line 271
    return-object v4

    .line 272
    :cond_e
    add-int/lit8 v7, v7, 0x1

    .line 273
    .line 274
    goto :goto_2

    .line 275
    :catchall_1
    sput-boolean v10, Lcom/alibaba/fastjson/parser/ParserConfig;->jdk8Error:Z

    .line 276
    .line 277
    :cond_f
    sget-boolean v3, Lcom/alibaba/fastjson/parser/ParserConfig;->jodaError:Z

    .line 278
    .line 279
    if-nez v3, :cond_11

    .line 280
    .line 281
    :try_start_2
    const-string v3, "org.joda.time."

    .line 282
    .line 283
    invoke-virtual {v6, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 284
    .line 285
    .line 286
    move-result v3

    .line 287
    if-eqz v3, :cond_11

    .line 288
    .line 289
    const-string v11, "org.joda.time.DateTime"

    .line 290
    .line 291
    const-string v12, "org.joda.time.LocalDate"

    .line 292
    .line 293
    const-string v13, "org.joda.time.LocalDateTime"

    .line 294
    .line 295
    const-string v14, "org.joda.time.LocalTime"

    .line 296
    .line 297
    const-string v15, "org.joda.time.Instant"

    .line 298
    .line 299
    const-string v16, "org.joda.time.Period"

    .line 300
    .line 301
    const-string v17, "org.joda.time.Duration"

    .line 302
    .line 303
    const-string v18, "org.joda.time.DateTimeZone"

    .line 304
    .line 305
    const-string v19, "org.joda.time.format.DateTimeFormatter"

    .line 306
    .line 307
    filled-new-array/range {v11 .. v19}, [Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v3

    .line 311
    move v7, v9

    .line 312
    :goto_3
    const/16 v8, 0x9

    .line 313
    .line 314
    if-ge v7, v8, :cond_11

    .line 315
    .line 316
    aget-object v8, v3, v7

    .line 317
    .line 318
    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    move-result v11

    .line 322
    if-eqz v11, :cond_10

    .line 323
    .line 324
    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 325
    .line 326
    .line 327
    move-result-object v3

    .line 328
    sget-object v4, Lcom/alibaba/fastjson/serializer/JodaCodec;->instance:Lcom/alibaba/fastjson/serializer/JodaCodec;

    .line 329
    .line 330
    invoke-virtual {v0, v3, v4}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 331
    .line 332
    .line 333
    return-object v4

    .line 334
    :cond_10
    add-int/lit8 v7, v7, 0x1

    .line 335
    .line 336
    goto :goto_3

    .line 337
    :catchall_2
    sput-boolean v10, Lcom/alibaba/fastjson/parser/ParserConfig;->jodaError:Z

    .line 338
    .line 339
    :cond_11
    sget-boolean v3, Lcom/alibaba/fastjson/parser/ParserConfig;->guavaError:Z

    .line 340
    .line 341
    if-nez v3, :cond_13

    .line 342
    .line 343
    const-string v3, "com.google.common.collect."

    .line 344
    .line 345
    invoke-virtual {v6, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 346
    .line 347
    .line 348
    move-result v3

    .line 349
    if-eqz v3, :cond_13

    .line 350
    .line 351
    :try_start_3
    const-string v3, "com.google.common.collect.HashMultimap"

    .line 352
    .line 353
    const-string v7, "com.google.common.collect.LinkedListMultimap"

    .line 354
    .line 355
    const-string v8, "com.google.common.collect.LinkedHashMultimap"

    .line 356
    .line 357
    const-string v11, "com.google.common.collect.ArrayListMultimap"

    .line 358
    .line 359
    const-string v12, "com.google.common.collect.TreeMultimap"

    .line 360
    .line 361
    filled-new-array {v3, v7, v8, v11, v12}, [Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object v3

    .line 365
    move v7, v9

    .line 366
    :goto_4
    const/4 v8, 0x5

    .line 367
    if-ge v7, v8, :cond_13

    .line 368
    .line 369
    aget-object v8, v3, v7

    .line 370
    .line 371
    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    move-result v11

    .line 375
    if-eqz v11, :cond_12

    .line 376
    .line 377
    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 378
    .line 379
    .line 380
    move-result-object v3

    .line 381
    sget-object v4, Lcom/alibaba/fastjson/serializer/GuavaCodec;->instance:Lcom/alibaba/fastjson/serializer/GuavaCodec;

    .line 382
    .line 383
    invoke-virtual {v0, v3, v4}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_0

    .line 384
    .line 385
    .line 386
    return-object v4

    .line 387
    :cond_12
    add-int/lit8 v7, v7, 0x1

    .line 388
    .line 389
    goto :goto_4

    .line 390
    :catch_0
    sput-boolean v10, Lcom/alibaba/fastjson/parser/ParserConfig;->guavaError:Z

    .line 391
    .line 392
    :cond_13
    const-string v3, "java.nio.ByteBuffer"

    .line 393
    .line 394
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 395
    .line 396
    .line 397
    move-result v3

    .line 398
    if-eqz v3, :cond_14

    .line 399
    .line 400
    sget-object v4, Lcom/alibaba/fastjson/serializer/ByteBufferCodec;->instance:Lcom/alibaba/fastjson/serializer/ByteBufferCodec;

    .line 401
    .line 402
    invoke-virtual {v0, v1, v4}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V

    .line 403
    .line 404
    .line 405
    :cond_14
    const-string v3, "java.nio.file.Path"

    .line 406
    .line 407
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 408
    .line 409
    .line 410
    move-result v3

    .line 411
    if-eqz v3, :cond_15

    .line 412
    .line 413
    sget-object v4, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    .line 414
    .line 415
    invoke-virtual {v0, v1, v4}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V

    .line 416
    .line 417
    .line 418
    :cond_15
    const-class v3, Ljava/util/Map$Entry;

    .line 419
    .line 420
    if-ne v1, v3, :cond_16

    .line 421
    .line 422
    sget-object v4, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    .line 423
    .line 424
    invoke-virtual {v0, v1, v4}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V

    .line 425
    .line 426
    .line 427
    :cond_16
    const-string v3, "org.javamoney.moneta.Money"

    .line 428
    .line 429
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 430
    .line 431
    .line 432
    move-result v3

    .line 433
    if-eqz v3, :cond_17

    .line 434
    .line 435
    sget-object v4, Lcom/alibaba/fastjson/support/moneta/MonetaCodec;->instance:Lcom/alibaba/fastjson/support/moneta/MonetaCodec;

    .line 436
    .line 437
    invoke-virtual {v0, v1, v4}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V

    .line 438
    .line 439
    .line 440
    :cond_17
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 441
    .line 442
    .line 443
    move-result-object v3

    .line 444
    invoke-virtual {v3}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    .line 445
    .line 446
    .line 447
    move-result-object v3

    .line 448
    :try_start_4
    const-class v6, Lcom/alibaba/fastjson/parser/deserializer/AutowiredObjectDeserializer;

    .line 449
    .line 450
    invoke-static {v6, v3}, Lcom/alibaba/fastjson/util/ServiceLoader;->load(Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/util/Set;

    .line 451
    .line 452
    .line 453
    move-result-object v3

    .line 454
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 455
    .line 456
    .line 457
    move-result-object v3

    .line 458
    :cond_18
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 459
    .line 460
    .line 461
    move-result v6

    .line 462
    if-eqz v6, :cond_19

    .line 463
    .line 464
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 465
    .line 466
    .line 467
    move-result-object v6

    .line 468
    check-cast v6, Lcom/alibaba/fastjson/parser/deserializer/AutowiredObjectDeserializer;

    .line 469
    .line 470
    invoke-interface {v6}, Lcom/alibaba/fastjson/parser/deserializer/AutowiredObjectDeserializer;->getAutowiredFor()Ljava/util/Set;

    .line 471
    .line 472
    .line 473
    move-result-object v7

    .line 474
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 475
    .line 476
    .line 477
    move-result-object v7

    .line 478
    :goto_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 479
    .line 480
    .line 481
    move-result v8

    .line 482
    if-eqz v8, :cond_18

    .line 483
    .line 484
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 485
    .line 486
    .line 487
    move-result-object v8

    .line 488
    check-cast v8, Ljava/lang/reflect/Type;

    .line 489
    .line 490
    invoke-virtual {v0, v8, v6}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 491
    .line 492
    .line 493
    goto :goto_5

    .line 494
    :catch_1
    :cond_19
    if-nez v4, :cond_1a

    .line 495
    .line 496
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/ParserConfig;->get(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 497
    .line 498
    .line 499
    move-result-object v4

    .line 500
    :cond_1a
    if-eqz v4, :cond_1b

    .line 501
    .line 502
    return-object v4

    .line 503
    :cond_1b
    invoke-virtual {v1}, Ljava/lang/Class;->isEnum()Z

    .line 504
    .line 505
    .line 506
    move-result v3

    .line 507
    if-eqz v3, :cond_1f

    .line 508
    .line 509
    iget-boolean v3, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->jacksonCompatible:Z

    .line 510
    .line 511
    if-eqz v3, :cond_1d

    .line 512
    .line 513
    invoke-virtual {v1}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    .line 514
    .line 515
    .line 516
    move-result-object v3

    .line 517
    array-length v4, v3

    .line 518
    :goto_6
    if-ge v9, v4, :cond_1d

    .line 519
    .line 520
    aget-object v6, v3, v9

    .line 521
    .line 522
    invoke-static {v6}, Lcom/alibaba/fastjson/util/TypeUtils;->isJacksonCreator(Ljava/lang/reflect/Method;)Z

    .line 523
    .line 524
    .line 525
    move-result v6

    .line 526
    if-eqz v6, :cond_1c

    .line 527
    .line 528
    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/parser/ParserConfig;->createJavaBeanDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 529
    .line 530
    .line 531
    move-result-object v1

    .line 532
    invoke-virtual {v0, v2, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V

    .line 533
    .line 534
    .line 535
    return-object v1

    .line 536
    :cond_1c
    add-int/lit8 v9, v9, 0x1

    .line 537
    .line 538
    goto :goto_6

    .line 539
    :cond_1d
    invoke-static {v1, v5}, Lcom/alibaba/fastjson/util/TypeUtils;->getAnnotation(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 540
    .line 541
    .line 542
    move-result-object v3

    .line 543
    check-cast v3, Lcom/alibaba/fastjson/annotation/JSONType;

    .line 544
    .line 545
    if-eqz v3, :cond_1e

    .line 546
    .line 547
    invoke-interface {v3}, Lcom/alibaba/fastjson/annotation/JSONType;->deserializer()Ljava/lang/Class;

    .line 548
    .line 549
    .line 550
    move-result-object v3

    .line 551
    :try_start_5
    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 552
    .line 553
    .line 554
    move-result-object v3

    .line 555
    check-cast v3, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 556
    .line 557
    invoke-virtual {v0, v1, v3}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 558
    .line 559
    .line 560
    return-object v3

    .line 561
    :catchall_3
    :cond_1e
    new-instance v3, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;

    .line 562
    .line 563
    invoke-direct {v3, v1}, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;-><init>(Ljava/lang/Class;)V

    .line 564
    .line 565
    .line 566
    goto :goto_8

    .line 567
    :cond_1f
    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    .line 568
    .line 569
    .line 570
    move-result v3

    .line 571
    if-eqz v3, :cond_20

    .line 572
    .line 573
    sget-object v3, Lcom/alibaba/fastjson/serializer/ObjectArrayCodec;->instance:Lcom/alibaba/fastjson/serializer/ObjectArrayCodec;

    .line 574
    .line 575
    goto :goto_8

    .line 576
    :cond_20
    const-class v3, Ljava/util/Set;

    .line 577
    .line 578
    if-eq v1, v3, :cond_27

    .line 579
    .line 580
    const-class v3, Ljava/util/HashSet;

    .line 581
    .line 582
    if-eq v1, v3, :cond_27

    .line 583
    .line 584
    const-class v3, Ljava/util/Collection;

    .line 585
    .line 586
    if-eq v1, v3, :cond_27

    .line 587
    .line 588
    const-class v4, Ljava/util/List;

    .line 589
    .line 590
    if-eq v1, v4, :cond_27

    .line 591
    .line 592
    const-class v4, Ljava/util/ArrayList;

    .line 593
    .line 594
    if-ne v1, v4, :cond_21

    .line 595
    .line 596
    goto :goto_7

    .line 597
    :cond_21
    invoke-virtual {v3, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 598
    .line 599
    .line 600
    move-result v3

    .line 601
    if-eqz v3, :cond_22

    .line 602
    .line 603
    sget-object v3, Lcom/alibaba/fastjson/serializer/CollectionCodec;->instance:Lcom/alibaba/fastjson/serializer/CollectionCodec;

    .line 604
    .line 605
    goto :goto_8

    .line 606
    :cond_22
    const-class v3, Ljava/util/Map;

    .line 607
    .line 608
    invoke-virtual {v3, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 609
    .line 610
    .line 611
    move-result v3

    .line 612
    if-eqz v3, :cond_23

    .line 613
    .line 614
    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    .line 615
    .line 616
    goto :goto_8

    .line 617
    :cond_23
    const-class v3, Ljava/lang/Throwable;

    .line 618
    .line 619
    invoke-virtual {v3, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 620
    .line 621
    .line 622
    move-result v3

    .line 623
    if-eqz v3, :cond_24

    .line 624
    .line 625
    new-instance v3, Lcom/alibaba/fastjson/parser/deserializer/ThrowableDeserializer;

    .line 626
    .line 627
    invoke-direct {v3, v0, v1}, Lcom/alibaba/fastjson/parser/deserializer/ThrowableDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;)V

    .line 628
    .line 629
    .line 630
    goto :goto_8

    .line 631
    :cond_24
    const-class v3, Lcom/alibaba/fastjson/parser/deserializer/PropertyProcessable;

    .line 632
    .line 633
    invoke-virtual {v3, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 634
    .line 635
    .line 636
    move-result v3

    .line 637
    if-eqz v3, :cond_25

    .line 638
    .line 639
    new-instance v3, Lcom/alibaba/fastjson/parser/deserializer/PropertyProcessableDeserializer;

    .line 640
    .line 641
    invoke-direct {v3, v1}, Lcom/alibaba/fastjson/parser/deserializer/PropertyProcessableDeserializer;-><init>(Ljava/lang/Class;)V

    .line 642
    .line 643
    .line 644
    goto :goto_8

    .line 645
    :cond_25
    const-class v3, Ljava/net/InetAddress;

    .line 646
    .line 647
    if-ne v1, v3, :cond_26

    .line 648
    .line 649
    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    .line 650
    .line 651
    goto :goto_8

    .line 652
    :cond_26
    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/parser/ParserConfig;->createJavaBeanDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 653
    .line 654
    .line 655
    move-result-object v3

    .line 656
    goto :goto_8

    .line 657
    :cond_27
    :goto_7
    sget-object v3, Lcom/alibaba/fastjson/serializer/CollectionCodec;->instance:Lcom/alibaba/fastjson/serializer/CollectionCodec;

    .line 658
    .line 659
    :goto_8
    invoke-virtual {v0, v2, v3}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V

    .line 660
    .line 661
    .line 662
    return-object v3
.end method

.method public getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .locals 2

    .line 663
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->get(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 664
    :cond_0
    instance-of v0, p1, Ljava/lang/Class;

    if-eqz v0, :cond_1

    .line 665
    move-object v0, p1

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {p0, v0, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object p0

    return-object p0

    .line 666
    :cond_1
    instance-of v0, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_3

    .line 667
    move-object v0, p1

    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 668
    instance-of v1, v0, Ljava/lang/Class;

    if-eqz v1, :cond_2

    .line 669
    check-cast v0, Ljava/lang/Class;

    invoke-virtual {p0, v0, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object p0

    return-object p0

    .line 670
    :cond_2
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object p0

    return-object p0

    .line 671
    :cond_3
    instance-of v0, p1, Ljava/lang/reflect/WildcardType;

    if-eqz v0, :cond_4

    .line 672
    check-cast p1, Ljava/lang/reflect/WildcardType;

    .line 673
    invoke-interface {p1}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object p1

    .line 674
    array-length v0, p1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_4

    const/4 v0, 0x0

    .line 675
    aget-object p1, p1, v0

    .line 676
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object p0

    return-object p0

    .line 677
    :cond_4
    sget-object p0, Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;

    return-object p0
.end method

.method public getDeserializers()Lcom/alibaba/fastjson/util/IdentityHashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/alibaba/fastjson/util/IdentityHashMap<",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public varargs initJavaBeanDeserializers([Ljava/lang/Class;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_2

    .line 4
    :cond_0
    array-length v0, p1

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_2

    .line 7
    .line 8
    aget-object v2, p1, v1

    .line 9
    .line 10
    if-nez v2, :cond_1

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_1
    invoke-virtual {p0, v2, v2}, Lcom/alibaba/fastjson/parser/ParserConfig;->createJavaBeanDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V

    .line 18
    .line 19
    .line 20
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_2
    :goto_2
    return-void
.end method

.method public isAsmEnable()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmEnable:Z

    .line 2
    .line 3
    return p0
.end method

.method public isAutoTypeSupport()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->autoTypeSupport:Z

    .line 2
    .line 3
    return p0
.end method

.method public isJacksonCompatible()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->jacksonCompatible:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPrimitive(Ljava/lang/Class;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->isPrimitive2(Ljava/lang/Class;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/alibaba/fastjson/JSON;->getMixInAnnotations(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->mixInDeserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 18
    .line 19
    const/4 v2, 0x4

    .line 20
    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/util/IdentityHashMap;-><init>(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->mixInDeserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 24
    .line 25
    invoke-virtual {p0, p1, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-virtual {v1, v0, p2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->deserializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 33
    .line 34
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public register(Lcom/alibaba/fastjson/spi/Module;)V
    .locals 0

    .line 7
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->modules:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public register(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->typeMapping:Ljava/util/concurrent/ConcurrentMap;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAsmEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public setAutoTypeSupport(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->autoTypeSupport:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDefaultClassLoader(Ljava/lang/ClassLoader;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->defaultClassLoader:Ljava/lang/ClassLoader;

    .line 2
    .line 3
    return-void
.end method

.method public setJacksonCompatible(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->jacksonCompatible:Z

    .line 2
    .line 3
    return-void
.end method

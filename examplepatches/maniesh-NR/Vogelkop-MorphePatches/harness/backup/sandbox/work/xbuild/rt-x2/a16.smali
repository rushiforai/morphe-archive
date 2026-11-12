.class public final La16;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldx3;

.field public final b:Landroid/credentials/CredentialManager;

.field public c:[B


# direct methods
.method public constructor <init>(Ldx3;Landroid/credentials/CredentialManager;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La16;->a:Ldx3;

    iput-object p2, p0, La16;->b:Landroid/credentials/CredentialManager;

    return-void
.end method

.method public static a(I)Ljava/lang/String;
    .registers 2

    if-eqz p0, :cond_1c

    const/4 v0, 0x1

    if-eq p0, v0, :cond_19

    const/4 v0, 0x2

    if-eq p0, v0, :cond_16

    const/4 v0, 0x3

    if-eq p0, v0, :cond_13

    const/4 v0, 0x4

    if-eq p0, v0, :cond_10

    const/4 p0, 0x0

    return-object p0

    :cond_10
    const-string p0, "internal"

    return-object p0

    :cond_13
    const-string p0, "hybrid"

    return-object p0

    :cond_16
    const-string p0, "ble"

    return-object p0

    :cond_19
    const-string p0, "nfc"

    return-object p0

    :cond_1c
    const-string p0, "usb"

    return-object p0
.end method


# virtual methods
.method public final b(Lb9h;Ljava/lang/String;[B[BILek2;)V
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    move-object/from16 v3, p3

    iput-object v3, v0, La16;->c:[B

    const/4 v4, 0x1

    move/from16 v5, p5

    if-ne v5, v4, :cond_11

    move v5, v4

    goto :goto_12

    :cond_11
    const/4 v5, 0x0

    :goto_12
    iget-object v6, v1, Lb9h;->e:[Ly8h;

    if-eqz v6, :cond_1b

    array-length v6, v6

    if-lez v6, :cond_1b

    move v6, v4

    goto :goto_1c

    :cond_1b
    const/4 v6, 0x0

    :goto_1c
    iget-object v7, v1, Lb9h;->h:Lwj2;

    if-eqz v7, :cond_26

    iget-object v7, v7, Lwj2;->b:Ljava/lang/String;

    if-eqz v7, :cond_26

    move v7, v4

    goto :goto_27

    :cond_26
    const/4 v7, 0x0

    :goto_27
    new-instance v8, Lorb;

    invoke-direct {v8}, Lorb;-><init>()V

    iget-object v9, v1, Lb9h;->b:[B

    const/16 v10, 0xb

    const-string v11, ""

    if-nez v9, :cond_36

    move-object v9, v11

    goto :goto_3a

    :cond_36
    invoke-static {v9, v10}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v9

    :goto_3a
    const-string v12, "challenge"

    invoke-virtual {v8, v9, v12}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v9, v1, Lb9h;->c:Ldpl;

    if-eqz v9, :cond_4d

    iget-wide v12, v9, Ldpl;->b:J

    const-wide/16 v14, 0x3e8

    div-long/2addr v12, v14

    const-string v9, "timeout"

    invoke-virtual {v8, v12, v13, v9}, Lorb;->o(JLjava/lang/String;)V

    :cond_4d
    const-string v9, "rpId"

    iget-object v12, v1, Lb9h;->d:Ljava/lang/String;

    invoke-virtual {v8, v12, v9}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v9, v1, Lb9h;->e:[Ly8h;

    if-eqz v9, :cond_b5

    array-length v9, v9

    if-lez v9, :cond_b5

    new-instance v9, Lvpb;

    invoke-direct {v9}, Lvpb;-><init>()V

    iget-object v12, v1, Lb9h;->e:[Ly8h;

    array-length v13, v12

    const/4 v14, 0x0

    :goto_64
    if-ge v14, v13, :cond_b0

    aget-object v15, v12, v14

    const-string v3, "type"

    const-string v4, "public-key"

    invoke-static {v3, v4}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v3

    iget-object v4, v15, Ly8h;->c:[B

    if-nez v4, :cond_76

    move-object v4, v11

    goto :goto_7a

    :cond_76
    invoke-static {v4, v10}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v4

    :goto_7a
    const-string v10, "id"

    invoke-virtual {v3, v4, v10}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v4, v15, Ly8h;->d:[I

    if-eqz v4, :cond_a8

    array-length v4, v4

    if-lez v4, :cond_a8

    new-instance v4, Lvpb;

    invoke-direct {v4}, Lvpb;-><init>()V

    iget-object v10, v15, Ly8h;->d:[I

    array-length v15, v10

    move-object/from16 v16, v10

    const/4 v10, 0x0

    :goto_91
    if-ge v10, v15, :cond_a3

    aget v17, v16, v10

    move/from16 v18, v10

    invoke-static/range {v17 .. v17}, La16;->a(I)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_a0

    invoke-virtual {v4, v10}, Lvpb;->a(Ljava/lang/Object;)V

    :cond_a0
    add-int/lit8 v10, v18, 0x1

    goto :goto_91

    :cond_a3
    const-string v10, "transports"

    invoke-virtual {v3, v4, v10}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_a8
    invoke-virtual {v9, v3}, Lvpb;->a(Ljava/lang/Object;)V

    add-int/lit8 v14, v14, 0x1

    const/16 v10, 0xb

    goto :goto_64

    :cond_b0
    const-string v3, "allowCredentials"

    invoke-virtual {v8, v9, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_b5
    iget v1, v1, Lb9h;->g:I

    const/4 v3, 0x1

    if-eq v1, v3, :cond_cc

    if-eqz v1, :cond_c5

    const/4 v3, 0x2

    if-eq v1, v3, :cond_c2

    const-string v1, "preferred"

    goto :goto_c7

    :cond_c2
    const-string v1, "discouraged"

    goto :goto_c7

    :cond_c5
    const-string v1, "required"

    :goto_c7
    const-string v3, "userVerification"

    invoke-virtual {v8, v1, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_cc
    iget-object v1, v8, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const-string v4, "androidx.credentials.BUNDLE_KEY_SUBTYPE"

    const-string v8, "androidx.credentials.BUNDLE_VALUE_SUBTYPE_GET_PUBLIC_KEY_CREDENTIAL_OPTION"

    invoke-virtual {v3, v4, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "androidx.credentials.BUNDLE_KEY_REQUEST_JSON"

    invoke-virtual {v3, v4, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v2, :cond_ea

    const-string v1, "androidx.credentials.BUNDLE_KEY_CLIENT_DATA_HASH"

    invoke-virtual {v3, v1, v2}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    :cond_ea
    const-string v1, "androidx.credentials.BUNDLE_KEY_IS_AUTO_SELECT_ALLOWED"

    invoke-virtual {v3, v1, v6}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    new-instance v1, Landroid/credentials/CredentialOption$Builder;

    const-string v2, "androidx.credentials.TYPE_PUBLIC_KEY_CREDENTIAL"

    invoke-direct {v1, v2, v3, v3}, Landroid/credentials/CredentialOption$Builder;-><init>(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;)V

    invoke-virtual {v1}, Landroid/credentials/CredentialOption$Builder;->build()Landroid/credentials/CredentialOption;

    move-result-object v1

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string v3, "androidx.credentials.BUNDLE_KEY_PREFER_IMMEDIATELY_AVAILABLE_CREDENTIALS"

    invoke-virtual {v2, v3, v5}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    new-instance v3, Landroid/credentials/GetCredentialRequest$Builder;

    invoke-direct {v3, v2}, Landroid/credentials/GetCredentialRequest$Builder;-><init>(Landroid/os/Bundle;)V

    invoke-virtual {v3, v1}, Landroid/credentials/GetCredentialRequest$Builder;->addCredentialOption(Landroid/credentials/CredentialOption;)Landroid/credentials/GetCredentialRequest$Builder;

    move-object/from16 v1, p2

    invoke-virtual {v3, v1}, Landroid/credentials/GetCredentialRequest$Builder;->setOrigin(Ljava/lang/String;)Landroid/credentials/GetCredentialRequest$Builder;

    invoke-virtual {v3}, Landroid/credentials/GetCredentialRequest$Builder;->build()Landroid/credentials/GetCredentialRequest;

    move-result-object v1

    iget-object v2, v0, La16;->b:Landroid/credentials/CredentialManager;

    iget-object v3, v0, La16;->a:Ldx3;

    invoke-virtual {v3}, Landroid/content/Context;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v4

    new-instance v6, Lz06;

    move-object/from16 v8, p6

    invoke-direct {v6, v0, v7, v8, v5}, Lz06;-><init>(La16;ZLek2;Z)V

    const/4 v0, 0x0

    move-object/from16 p3, v0

    move-object/from16 p2, v1

    move-object/from16 p0, v2

    move-object/from16 p1, v3

    move-object/from16 p4, v4

    move-object/from16 p5, v6

    invoke-virtual/range {p0 .. p5}, Landroid/credentials/CredentialManager;->getCredential(Landroid/content/Context;Landroid/credentials/GetCredentialRequest;Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Landroid/os/OutcomeReceiver;)V

    return-void
.end method

.method public final c(Lx8h;Ljava/lang/String;[B[BZLek2;)V
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    move-object/from16 v3, p3

    iput-object v3, v0, La16;->c:[B

    new-instance v3, Lorb;

    invoke-direct {v3}, Lorb;-><init>()V

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    iget-object v5, v1, Lx8h;->b:Lc9h;

    iget-object v5, v5, Lc9h;->b:Ljava/lang/String;

    const-string v6, "id"

    invoke-virtual {v4, v5, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v5, v1, Lx8h;->b:Lc9h;

    iget-object v5, v5, Lc9h;->c:Ljava/lang/String;

    const-string v7, "name"

    invoke-virtual {v4, v5, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "rp"

    invoke-virtual {v3, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    iget-object v5, v1, Lx8h;->c:Ld9h;

    iget-object v5, v5, Ld9h;->b:[B

    const/16 v8, 0xb

    const-string v9, ""

    if-nez v5, :cond_3c

    move-object v5, v9

    goto :goto_40

    :cond_3c
    invoke-static {v5, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v5

    :goto_40
    invoke-virtual {v4, v5, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v5, v1, Lx8h;->c:Ld9h;

    iget-object v5, v5, Ld9h;->c:Ljava/lang/String;

    invoke-virtual {v4, v5, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v5, v1, Lx8h;->c:Ld9h;

    iget-object v5, v5, Ld9h;->d:Ljava/lang/String;

    const-string v7, "displayName"

    invoke-virtual {v4, v5, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "user"

    invoke-virtual {v3, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v4, v1, Lx8h;->d:[B

    if-nez v4, :cond_5e

    move-object v4, v9

    goto :goto_62

    :cond_5e
    invoke-static {v4, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v4

    :goto_62
    const-string v5, "challenge"

    invoke-virtual {v3, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v4, Lvpb;

    invoke-direct {v4}, Lvpb;-><init>()V

    iget-object v5, v1, Lx8h;->e:[Lz8h;

    const-string v7, "public-key"

    const-string v10, "type"

    if-eqz v5, :cond_8b

    array-length v12, v5

    const/4 v13, 0x0

    :goto_76
    if-ge v13, v12, :cond_8b

    aget-object v14, v5, v13

    invoke-static {v10, v7}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v15

    const-string v11, "alg"

    iget v14, v14, Lz8h;->c:I

    invoke-virtual {v15, v14, v11}, Lorb;->n(ILjava/lang/String;)V

    invoke-virtual {v4, v15}, Lvpb;->a(Ljava/lang/Object;)V

    add-int/lit8 v13, v13, 0x1

    goto :goto_76

    :cond_8b
    const-string v5, "pubKeyCredParams"

    invoke-virtual {v3, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v4, v1, Lx8h;->f:Ldpl;

    if-eqz v4, :cond_9e

    iget-wide v4, v4, Ldpl;->b:J

    const-wide/16 v11, 0x3e8

    div-long/2addr v4, v11

    const-string v11, "timeout"

    invoke-virtual {v3, v4, v5, v11}, Lorb;->o(JLjava/lang/String;)V

    :cond_9e
    iget-object v4, v1, Lx8h;->g:[Ly8h;

    if-eqz v4, :cond_fe

    array-length v4, v4

    if-lez v4, :cond_fe

    new-instance v4, Lvpb;

    invoke-direct {v4}, Lvpb;-><init>()V

    iget-object v5, v1, Lx8h;->g:[Ly8h;

    array-length v11, v5

    const/4 v12, 0x0

    :goto_ae
    if-ge v12, v11, :cond_f9

    aget-object v13, v5, v12

    invoke-static {v10, v7}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v14

    iget-object v15, v13, Ly8h;->c:[B

    if-nez v15, :cond_bc

    move-object v15, v9

    goto :goto_c0

    :cond_bc
    invoke-static {v15, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v15

    :goto_c0
    invoke-virtual {v14, v15, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v15, v13, Ly8h;->d:[I

    if-eqz v15, :cond_ed

    array-length v15, v15

    if-lez v15, :cond_ed

    new-instance v15, Lvpb;

    invoke-direct {v15}, Lvpb;-><init>()V

    iget-object v13, v13, Ly8h;->d:[I

    array-length v8, v13

    move-object/from16 v16, v5

    const/4 v5, 0x0

    :goto_d5
    if-ge v5, v8, :cond_e7

    aget v17, v13, v5

    move/from16 v18, v5

    invoke-static/range {v17 .. v17}, La16;->a(I)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_e4

    invoke-virtual {v15, v5}, Lvpb;->a(Ljava/lang/Object;)V

    :cond_e4
    add-int/lit8 v5, v18, 0x1

    goto :goto_d5

    :cond_e7
    const-string v5, "transports"

    invoke-virtual {v14, v15, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_ef

    :cond_ed
    move-object/from16 v16, v5

    :goto_ef
    invoke-virtual {v4, v14}, Lvpb;->a(Ljava/lang/Object;)V

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v5, v16

    const/16 v8, 0xb

    goto :goto_ae

    :cond_f9
    const-string v5, "excludeCredentials"

    invoke-virtual {v3, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_fe
    iget-object v4, v1, Lx8h;->h:Lfk2;

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v4, :cond_148

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    iget-object v7, v1, Lx8h;->h:Lfk2;

    iget v7, v7, Lfk2;->b:I

    if-eqz v7, :cond_11b

    if-ne v7, v6, :cond_114

    const-string v7, "platform"

    goto :goto_116

    :cond_114
    const-string v7, "cross-platform"

    :goto_116
    const-string v8, "authenticatorAttachment"

    invoke-virtual {v4, v7, v8}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_11b
    iget-object v7, v1, Lx8h;->h:Lfk2;

    iget v7, v7, Lfk2;->c:I

    const-string v8, "preferred"

    const-string v9, "required"

    const-string v10, "discouraged"

    if-eq v7, v6, :cond_12d

    if-eq v7, v5, :cond_12b

    move-object v7, v10

    goto :goto_12e

    :cond_12b
    move-object v7, v9

    goto :goto_12e

    :cond_12d
    move-object v7, v8

    :goto_12e
    const-string v11, "residentKey"

    invoke-virtual {v4, v7, v11}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v7, v1, Lx8h;->h:Lfk2;

    iget v7, v7, Lfk2;->d:I

    if-eqz v7, :cond_13d

    if-ne v7, v5, :cond_13e

    move-object v8, v10

    goto :goto_13e

    :cond_13d
    move-object v8, v9

    :cond_13e
    :goto_13e
    const-string v7, "userVerification"

    invoke-virtual {v4, v8, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v7, "authenticatorSelection"

    invoke-virtual {v3, v4, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_148
    iget v1, v1, Lx8h;->j:I

    if-eq v1, v6, :cond_15a

    if-eq v1, v5, :cond_157

    const/4 v4, 0x3

    if-eq v1, v4, :cond_154

    const-string v1, "none"

    goto :goto_15c

    :cond_154
    const-string v1, "enterprise"

    goto :goto_15c

    :cond_157
    const-string v1, "direct"

    goto :goto_15c

    :cond_15a
    const-string v1, "indirect"

    :goto_15c
    const-string v4, "attestation"

    invoke-virtual {v3, v1, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, v3, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const-string v4, "androidx.credentials.BUNDLE_KEY_SUBTYPE"

    const-string v5, "androidx.credentials.BUNDLE_VALUE_SUBTYPE_CREATE_PUBLIC_KEY_CREDENTIAL_REQUEST"

    invoke-virtual {v3, v4, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "androidx.credentials.BUNDLE_KEY_REQUEST_JSON"

    invoke-virtual {v3, v4, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v2, :cond_17f

    const-string v1, "androidx.credentials.BUNDLE_KEY_CLIENT_DATA_HASH"

    invoke-virtual {v3, v1, v2}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    :cond_17f
    new-instance v1, Landroid/credentials/CreateCredentialRequest$Builder;

    const-string v2, "androidx.credentials.TYPE_PUBLIC_KEY_CREDENTIAL"

    invoke-direct {v1, v2, v3, v3}, Landroid/credentials/CreateCredentialRequest$Builder;-><init>(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;)V

    invoke-virtual {v1, v6}, Landroid/credentials/CreateCredentialRequest$Builder;->setAlwaysSendAppInfoToProvider(Z)Landroid/credentials/CreateCredentialRequest$Builder;

    move-result-object v1

    move-object/from16 v2, p2

    invoke-virtual {v1, v2}, Landroid/credentials/CreateCredentialRequest$Builder;->setOrigin(Ljava/lang/String;)Landroid/credentials/CreateCredentialRequest$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/credentials/CreateCredentialRequest$Builder;->build()Landroid/credentials/CreateCredentialRequest;

    move-result-object v1

    iget-object v2, v0, La16;->b:Landroid/credentials/CredentialManager;

    iget-object v3, v0, La16;->a:Ldx3;

    invoke-virtual {v3}, Landroid/content/Context;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v4

    new-instance v5, Ly06;

    move/from16 v6, p5

    move-object/from16 v7, p6

    invoke-direct {v5, v0, v6, v7}, Ly06;-><init>(La16;ZLek2;)V

    const/4 v0, 0x0

    move-object/from16 p3, v0

    move-object/from16 p2, v1

    move-object/from16 p0, v2

    move-object/from16 p1, v3

    move-object/from16 p4, v4

    move-object/from16 p5, v5

    invoke-virtual/range {p0 .. p5}, Landroid/credentials/CredentialManager;->createCredential(Landroid/content/Context;Landroid/credentials/CreateCredentialRequest;Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Landroid/os/OutcomeReceiver;)V

    return-void
.end method

.method public final d(Ljava/lang/String;Z)Lz7d;
    .registers 15

    new-instance v0, Lorb;

    invoke-direct {v0, p1}, Lorb;-><init>(Ljava/lang/String;)V

    const-string p1, "response"

    invoke-virtual {v0, p1}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object p1

    iget-object v1, p1, Lorb;->a:Lorg/json/JSONObject;

    new-instance v2, Lz7d;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lz7d;-><init>(I)V

    new-instance v4, Lbc5;

    invoke-direct {v4, v3}, Lbc5;-><init>(I)V

    iput-object v4, v2, Lz7d;->b:Lbc5;

    const-string v4, "id"

    invoke-virtual {v0, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v2, Lz7d;->b:Lbc5;

    iput-object v4, v5, Lbc5;->b:Ljava/lang/String;

    const-string v4, "rawId"

    invoke-virtual {v0, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/16 v6, 0xb

    invoke-static {v4, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v4

    iput-object v4, v5, Lbc5;->c:[B

    iget-object p0, p0, La16;->c:[B

    iget-object v4, v2, Lz7d;->b:Lbc5;

    if-eqz p0, :cond_3b

    iput-object p0, v4, Lbc5;->d:[B

    goto :goto_47

    :cond_3b
    const-string p0, "clientDataJSON"

    invoke-virtual {p1, p0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    iput-object p0, v4, Lbc5;->d:[B

    :goto_47
    const-string p0, "attestationObject"

    invoke-virtual {p1, p0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    iput-object p0, v2, Lz7d;->d:[B

    const-string p0, "authenticatorData"

    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_67

    iget-object v4, v2, Lz7d;->b:Lbc5;

    invoke-virtual {p1, p0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    iput-object p0, v4, Lbc5;->e:[B

    :cond_67
    const-string p0, "publicKey"

    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_79

    invoke-virtual {p1, p0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    iput-object p0, v2, Lz7d;->f:[B

    :cond_79
    const-string p0, "publicKeyAlgorithm"

    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_87

    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p0

    iput p0, v2, Lz7d;->g:I

    :cond_87
    const-string p0, "transports"

    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v1, :cond_f8

    invoke-virtual {p1, p0}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object p0

    iget-object p1, p0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    new-array v1, v1, [I

    iput-object v1, v2, Lz7d;->e:[I

    move v1, v3

    :goto_a0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v1, v6, :cond_fc

    iget-object v6, v2, Lz7d;->e:[I

    invoke-virtual {p0, v1}, Lvpb;->d(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    move-result v8

    const/4 v9, 0x4

    const/4 v10, 0x3

    const/4 v11, -0x1

    sparse-switch v8, :sswitch_data_14e

    goto :goto_e8

    :sswitch_b7
    const-string v8, "cable"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e8

    move v11, v9

    goto :goto_e8

    :sswitch_c1
    const-string v8, "usb"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e8

    move v11, v10

    goto :goto_e8

    :sswitch_cb
    const-string v8, "nfc"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e8

    move v11, v4

    goto :goto_e8

    :sswitch_d5
    const-string v8, "ble"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e8

    move v11, v5

    goto :goto_e8

    :sswitch_df
    const-string v8, "hybrid"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e8

    move v11, v3

    :cond_e8
    :goto_e8
    packed-switch v11, :pswitch_data_164

    goto :goto_f3

    :pswitch_ec
    move v9, v3

    goto :goto_f3

    :pswitch_ee
    move v9, v5

    goto :goto_f3

    :pswitch_f0
    move v9, v4

    goto :goto_f3

    :pswitch_f2
    move v9, v10

    :goto_f3
    aput v9, v6, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_a0

    :cond_f8
    new-array p0, v3, [I

    iput-object p0, v2, Lz7d;->e:[I

    :cond_fc
    iget-object p0, v0, Lorb;->a:Lorg/json/JSONObject;

    const-string p1, "authenticatorAttachment"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11f

    invoke-virtual {v0, p1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "platform"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_115

    iput v5, v2, Lz7d;->c:I

    goto :goto_11f

    :cond_115
    const-string v1, "cross-platform"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_11f

    iput v4, v2, Lz7d;->c:I

    :cond_11f
    :goto_11f
    iput-boolean p2, v2, Lz7d;->h:Z

    const-string p1, "clientExtensionResults"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_14d

    invoke-virtual {v0, p1}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object p0

    iget-object p1, p0, Lorb;->a:Lorg/json/JSONObject;

    const-string p2, "credProps"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_14d

    invoke-virtual {p0, p2}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object p0

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    const-string p1, "rk"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_14d

    iput-boolean v5, v2, Lz7d;->i:Z

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p0

    iput-boolean p0, v2, Lz7d;->j:Z

    :cond_14d
    return-object v2

    :sswitch_data_14e
    .sparse-switch
        -0x47b09e04 -> :sswitch_df
        0x17d5b -> :sswitch_d5
        0x1a9ab -> :sswitch_cb
        0x1c584 -> :sswitch_c1
        0x5a0ac3d -> :sswitch_b7
    .end sparse-switch

    :pswitch_data_164
    .packed-switch 0x0
        :pswitch_f2
        :pswitch_f0
        :pswitch_ee
        :pswitch_ec
        :pswitch_f2
    .end packed-switch
.end method

.method public final e(Ljava/lang/String;Z)Lrw9;
    .registers 10

    new-instance v0, Lorb;

    invoke-direct {v0, p1}, Lorb;-><init>(Ljava/lang/String;)V

    const-string p1, "response"

    invoke-virtual {v0, p1}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object p1

    iget-object v1, p1, Lorb;->a:Lorg/json/JSONObject;

    new-instance v2, Lrw9;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lrw9;-><init>(I)V

    new-instance v4, Lbc5;

    invoke-direct {v4, v3}, Lbc5;-><init>(I)V

    iput-object v4, v2, Lrw9;->b:Lbc5;

    const-string v5, "id"

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lbc5;->b:Ljava/lang/String;

    iget-object v4, v2, Lrw9;->b:Lbc5;

    const-string v5, "rawId"

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0xb

    invoke-static {v5, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v5

    iput-object v5, v4, Lbc5;->c:[B

    iget-object p0, p0, La16;->c:[B

    iget-object v4, v2, Lrw9;->b:Lbc5;

    if-eqz p0, :cond_3b

    iput-object p0, v4, Lbc5;->d:[B

    goto :goto_47

    :cond_3b
    const-string p0, "clientDataJSON"

    invoke-virtual {p1, p0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    iput-object p0, v4, Lbc5;->d:[B

    :goto_47
    iget-object p0, v2, Lrw9;->b:Lbc5;

    const-string v4, "authenticatorData"

    invoke-virtual {p1, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v4

    iput-object v4, p0, Lbc5;->e:[B

    const-string p0, "signature"

    invoke-virtual {p1, p0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    iput-object p0, v2, Lrw9;->d:[B

    const-string p0, "userHandle"

    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_79

    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_79

    invoke-virtual {p1, p0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    iput-object p0, v2, Lrw9;->e:[B

    :cond_79
    iget-object p0, v0, Lorb;->a:Lorg/json/JSONObject;

    const-string p1, "authenticatorAttachment"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_9e

    invoke-virtual {v0, p1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "platform"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_93

    const/4 p0, 0x1

    iput p0, v2, Lrw9;->c:I

    goto :goto_9e

    :cond_93
    const-string p1, "cross-platform"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_9e

    const/4 p0, 0x2

    iput p0, v2, Lrw9;->c:I

    :cond_9e
    :goto_9e
    new-instance p0, Lxj2;

    invoke-direct {p0, v3}, Lxj2;-><init>(I)V

    iput-object p0, v2, Lrw9;->f:Lxj2;

    iput-boolean p2, p0, Lxj2;->b:Z

    return-object v2
.end method

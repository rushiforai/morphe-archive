.class public Lcom/tencent/youtu/sdkkitframework/common/EncryptUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final head:Ljava/lang/String; = "enhance_encrypt_method=1"

.field public static final publicKey:Ljava/lang/String; = "04831b62b0b4f66cbd374b03d025dad9f1e4d3e19d2ed6180af3f169bf9de51b600ba6be92d06613a197db786bcfc8da5fbbe154af9566d3bed2ad372395b24843"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private byte2String([B)Ljava/lang/String;
    .locals 5

    .line 1
    new-instance p0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    array-length v0, p1

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_2

    .line 9
    .line 10
    aget-byte v2, p1, v1

    .line 11
    .line 12
    and-int/lit8 v3, v2, 0xf

    .line 13
    .line 14
    and-int/lit16 v2, v2, 0xf0

    .line 15
    .line 16
    shr-int/lit8 v2, v2, 0x4

    .line 17
    .line 18
    const/16 v4, 0xa

    .line 19
    .line 20
    if-lt v2, v4, :cond_0

    .line 21
    .line 22
    add-int/lit8 v2, v2, 0x57

    .line 23
    .line 24
    int-to-char v2, v2

    .line 25
    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 26
    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    add-int/lit8 v2, v2, 0x30

    .line 30
    .line 31
    int-to-char v2, v2

    .line 32
    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 33
    .line 34
    .line 35
    :goto_1
    if-lt v3, v4, :cond_1

    .line 36
    .line 37
    add-int/lit8 v3, v3, 0x57

    .line 38
    .line 39
    int-to-char v2, v3

    .line 40
    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 41
    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_1
    add-int/lit8 v3, v3, 0x30

    .line 45
    .line 46
    int-to-char v2, v3

    .line 47
    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 48
    .line 49
    .line 50
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method private char2bytewithasc2(C)B
    .locals 1

    const/16 p0, 0x30

    if-lt p1, p0, :cond_0

    const/16 v0, 0x39

    if-gt p1, v0, :cond_0

    sub-int/2addr p1, p0

    :goto_0
    int-to-byte p0, p1

    return p0

    :cond_0
    const/16 p0, 0x41

    if-lt p1, p0, :cond_1

    const/16 p0, 0x46

    if-gt p1, p0, :cond_1

    add-int/lit8 p1, p1, -0x37

    goto :goto_0

    :cond_1
    const/16 p0, 0x61

    if-lt p1, p0, :cond_2

    const/16 p0, 0x66

    if-gt p1, p0, :cond_2

    add-int/lit8 p1, p1, -0x57

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method public static createRequestFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v3, "RequestLog"

    .line 21
    .line 22
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_0

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_0

    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return-object p0

    .line 49
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string p0, ".txt"

    .line 58
    .line 59
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    new-instance v0, Ljava/io/File;

    .line 89
    .line 90
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-nez p0, :cond_1

    .line 98
    .line 99
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .line 101
    .line 102
    return-object v0

    .line 103
    :catch_0
    move-exception p0

    .line 104
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 105
    .line 106
    .line 107
    :cond_1
    return-object v0
.end method

.method public static intToBytes(I)[B
    .locals 5

    .line 1
    and-int/lit16 v0, p0, 0xff

    .line 2
    .line 3
    int-to-byte v0, v0

    .line 4
    shr-int/lit8 v1, p0, 0x8

    .line 5
    .line 6
    and-int/lit16 v1, v1, 0xff

    .line 7
    .line 8
    int-to-byte v1, v1

    .line 9
    shr-int/lit8 v2, p0, 0x10

    .line 10
    .line 11
    and-int/lit16 v2, v2, 0xff

    .line 12
    .line 13
    int-to-byte v2, v2

    .line 14
    shr-int/lit8 p0, p0, 0x18

    .line 15
    .line 16
    and-int/lit16 p0, p0, 0xff

    .line 17
    .line 18
    int-to-byte p0, p0

    .line 19
    const/4 v3, 0x4

    .line 20
    new-array v3, v3, [B

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    aput-byte v0, v3, v4

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    aput-byte v1, v3, v0

    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    aput-byte v2, v3, v0

    .line 30
    .line 31
    const/4 v0, 0x3

    .line 32
    aput-byte p0, v3, v0

    .line 33
    .line 34
    return-object v3
.end method

.method private string2bytes(Ljava/lang/String;)[B
    .locals 7

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, 0x1

    .line 6
    .line 7
    div-int/lit8 v0, v0, 0x2

    .line 8
    .line 9
    new-array v1, v0, [B

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    move v3, v2

    .line 13
    move v4, v3

    .line 14
    :goto_0
    if-ge v3, v0, :cond_0

    .line 15
    .line 16
    aput-byte v2, v1, v3

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    if-ge v4, v5, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    invoke-direct {p0, v5}, Lcom/tencent/youtu/sdkkitframework/common/EncryptUtil;->char2bytewithasc2(C)B

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    shl-int/lit8 v5, v5, 0x4

    .line 33
    .line 34
    int-to-byte v5, v5

    .line 35
    aput-byte v5, v1, v3

    .line 36
    .line 37
    add-int/lit8 v5, v4, 0x1

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    if-ge v5, v6, :cond_0

    .line 44
    .line 45
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    invoke-direct {p0, v5}, Lcom/tencent/youtu/sdkkitframework/common/EncryptUtil;->char2bytewithasc2(C)B

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    aget-byte v6, v1, v3

    .line 54
    .line 55
    or-int/2addr v5, v6

    .line 56
    int-to-byte v5, v5

    .line 57
    aput-byte v5, v1, v3

    .line 58
    .line 59
    add-int/lit8 v4, v4, 0x2

    .line 60
    .line 61
    add-int/lit8 v3, v3, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    return-object v1
.end method

.method public static writeBytesToFile(Ljava/io/File;[B)V
    .locals 3

    .line 1
    new-instance v0, Ljava/io/FileOutputStream;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/io/ByteArrayInputStream;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 9
    .line 10
    .line 11
    const/16 p1, 0x400

    .line 12
    .line 13
    new-array p1, p1, [B

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p0, p1}, Ljava/io/InputStream;->read([B)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, -0x1

    .line 20
    if-eq v1, v2, :cond_0

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, p1, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static writeFile(Ljava/io/File;Ljava/lang/String;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Ljava/io/PrintWriter;

    .line 3
    .line 4
    new-instance v2, Ljava/io/BufferedWriter;

    .line 5
    .line 6
    new-instance v3, Ljava/io/FileWriter;

    .line 7
    .line 8
    const/4 v4, 0x1

    .line 9
    invoke-direct {v3, p0, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v2, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 16
    .line 17
    .line 18
    :try_start_1
    invoke-virtual {v1, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    move-object v0, v1

    .line 30
    goto :goto_1

    .line 31
    :catch_0
    move-exception p0

    .line 32
    move-object v0, v1

    .line 33
    goto :goto_0

    .line 34
    :catchall_1
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :catch_1
    move-exception p0

    .line 37
    :goto_0
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 38
    .line 39
    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void

    .line 46
    :goto_1
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 49
    .line 50
    .line 51
    :cond_1
    throw p0
.end method


# virtual methods
.method public generateEncReq(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    new-instance p0, Lcom/tencent/youtu/sdkkitframework/common/FaceLiveReq;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/common/FaceLiveReq;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/youtu/sdkkitframework/common/FaceLiveReq;->app_id:Ljava/lang/String;

    .line 7
    .line 8
    const-string p2, ""

    .line 9
    .line 10
    if-ne p3, p2, :cond_0

    .line 11
    .line 12
    const-string p3, "not_set"

    .line 13
    .line 14
    :cond_0
    iput-object p3, p0, Lcom/tencent/youtu/sdkkitframework/common/FaceLiveReq;->session_id:Ljava/lang/String;

    .line 15
    .line 16
    new-instance p2, Ljava/security/SecureRandom;

    .line 17
    .line 18
    invoke-direct {p2}, Ljava/security/SecureRandom;-><init>()V

    .line 19
    .line 20
    .line 21
    const/16 p3, 0x10

    .line 22
    .line 23
    new-array p4, p3, [B

    .line 24
    .line 25
    invoke-virtual {p2, p4}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 26
    .line 27
    .line 28
    new-array v0, p3, [B

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 31
    .line 32
    .line 33
    new-instance p2, Ljavax/crypto/spec/SecretKeySpec;

    .line 34
    .line 35
    const-string v1, "AES"

    .line 36
    .line 37
    invoke-direct {p2, v0, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const-string v0, "MD5"

    .line 41
    .line 42
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p2}, Ljavax/crypto/spec/SecretKeySpec;->getEncoded()[B

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    array-length v1, v1

    .line 51
    add-int/2addr v1, p3

    .line 52
    new-array v1, v1, [B

    .line 53
    .line 54
    invoke-virtual {p2}, Ljavax/crypto/spec/SecretKeySpec;->getEncoded()[B

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {p2}, Ljavax/crypto/spec/SecretKeySpec;->getEncoded()[B

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    array-length v3, v3

    .line 63
    const/4 v4, 0x0

    .line 64
    invoke-static {v2, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2}, Ljavax/crypto/spec/SecretKeySpec;->getEncoded()[B

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    array-length v2, v2

    .line 72
    invoke-static {p4, v4, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Ljava/lang/StringBuffer;

    .line 83
    .line 84
    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 85
    .line 86
    .line 87
    :goto_0
    array-length v2, v0

    .line 88
    const/4 v3, 0x1

    .line 89
    if-ge v4, v2, :cond_2

    .line 90
    .line 91
    aget-byte v2, v0, v4

    .line 92
    .line 93
    and-int/lit16 v2, v2, 0xff

    .line 94
    .line 95
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-ne v2, v3, :cond_1

    .line 104
    .line 105
    const-string v2, "0"

    .line 106
    .line 107
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 108
    .line 109
    .line 110
    aget-byte v2, v0, v4

    .line 111
    .line 112
    and-int/lit16 v2, v2, 0xff

    .line 113
    .line 114
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_1
    aget-byte v2, v0, v4

    .line 123
    .line 124
    and-int/lit16 v2, v2, 0xff

    .line 125
    .line 126
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 131
    .line 132
    .line 133
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/FaceLiveReq;->sign:Ljava/lang/String;

    .line 141
    .line 142
    const-string v0, "AES/CBC/PKCS5Padding"

    .line 143
    .line 144
    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    new-instance v1, Ljavax/crypto/spec/IvParameterSpec;

    .line 149
    .line 150
    invoke-direct {v1, p4}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, v3, p2, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-virtual {p2}, Ljavax/crypto/spec/SecretKeySpec;->getEncoded()[B

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    array-length v0, v0

    .line 169
    add-int/2addr v0, p3

    .line 170
    array-length p3, p1

    .line 171
    add-int/2addr v0, p3

    .line 172
    new-array p3, v0, [B

    .line 173
    .line 174
    invoke-static {p3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 175
    .line 176
    .line 177
    move-result-object p3

    .line 178
    invoke-virtual {p2}, Ljavax/crypto/spec/SecretKeySpec;->getEncoded()[B

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    invoke-virtual {p3, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 183
    .line 184
    .line 185
    invoke-virtual {p3, p4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p3, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 189
    .line 190
    .line 191
    new-instance p1, Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->array()[B

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    const/4 p3, 0x2

    .line 198
    invoke-static {p2, p3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p2

    .line 202
    invoke-direct {p1, p2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/FaceLiveReq;->data:Ljava/lang/String;

    .line 206
    .line 207
    new-instance p1, Lcom/tencent/youtu/sdkkitframework/common/WeJson;

    .line 208
    .line 209
    invoke-direct {p1}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;-><init>()V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1, p0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    return-object p0
.end method

.method public generateSMReq(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 1
    new-instance p0, Lcom/tencent/youtu/sdkkitframework/common/FaceLiveReq;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/common/FaceLiveReq;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/youtu/sdkkitframework/common/FaceLiveReq;->app_id:Ljava/lang/String;

    .line 7
    .line 8
    const-string p2, ""

    .line 9
    .line 10
    if-ne p3, p2, :cond_0

    .line 11
    .line 12
    const-string p3, "not_set"

    .line 13
    .line 14
    :cond_0
    iput-object p3, p0, Lcom/tencent/youtu/sdkkitframework/common/FaceLiveReq;->session_id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {}, Lcom/tenpay/utils/SMUtils;->getInstance()Lcom/tenpay/utils/SMUtils;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-virtual {p3}, Lcom/tenpay/utils/SMUtils;->SM4GenKey()[B

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    new-instance p1, Ljava/security/SecureRandom;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/security/SecureRandom;-><init>()V

    .line 31
    .line 32
    .line 33
    const/16 p3, 0x10

    .line 34
    .line 35
    new-array v4, p3, [B

    .line 36
    .line 37
    invoke-virtual {p1, v4}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 38
    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    new-array v5, p1, [B

    .line 42
    .line 43
    invoke-static {}, Lcom/tenpay/utils/SMUtils;->getInstance()Lcom/tenpay/utils/SMUtils;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/16 v2, 0x10

    .line 48
    .line 49
    invoke-virtual/range {v0 .. v5}, Lcom/tenpay/utils/SMUtils;->sm4GCMEncryptNoPadding([BI[B[B[B)[B

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {}, Lcom/tenpay/utils/SMUtils;->getInstance()Lcom/tenpay/utils/SMUtils;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const-string v2, "04831b62b0b4f66cbd374b03d025dad9f1e4d3e19d2ed6180af3f169bf9de51b600ba6be92d06613a197db786bcfc8da5fbbe154af9566d3bed2ad372395b24843"

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Lcom/tenpay/utils/SMUtils;->SM2InitCtxWithPubKey(Ljava/lang/String;)J

    .line 60
    .line 61
    .line 62
    move-result-wide v5

    .line 63
    invoke-static {}, Lcom/tenpay/utils/SMUtils;->getInstance()Lcom/tenpay/utils/SMUtils;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1, v5, v6, v3, v2}, Lcom/tenpay/utils/SMUtils;->SM2Encrypt(J[BLjava/lang/String;)[B

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-static {}, Lcom/tenpay/utils/SMUtils;->getInstance()Lcom/tenpay/utils/SMUtils;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2, v5, v6}, Lcom/tenpay/utils/SMUtils;->SM2FreeCtx(J)V

    .line 76
    .line 77
    .line 78
    new-instance v2, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v2, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    array-length p2, v1

    .line 84
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    new-array v2, p3, [B

    .line 96
    .line 97
    array-length v3, v0

    .line 98
    sub-int/2addr v3, p3

    .line 99
    move v5, p1

    .line 100
    :goto_0
    array-length v6, v0

    .line 101
    if-ge v3, v6, :cond_1

    .line 102
    .line 103
    aget-byte v6, v0, v3

    .line 104
    .line 105
    aput-byte v6, v2, v5

    .line 106
    .line 107
    add-int/lit8 v5, v5, 0x1

    .line 108
    .line 109
    add-int/lit8 v3, v3, 0x1

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_1
    array-length v3, v0

    .line 113
    sub-int/2addr v3, p3

    .line 114
    new-array v3, v3, [B

    .line 115
    .line 116
    :goto_1
    array-length v5, v0

    .line 117
    sub-int/2addr v5, p3

    .line 118
    if-ge p1, v5, :cond_2

    .line 119
    .line 120
    aget-byte v5, v0, p1

    .line 121
    .line 122
    aput-byte v5, v3, p1

    .line 123
    .line 124
    add-int/lit8 p1, p1, 0x1

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_2
    const/4 p1, 0x2

    .line 128
    invoke-static {v3, p1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p3

    .line 132
    array-length v0, p2

    .line 133
    add-int/lit8 v0, v0, 0x20

    .line 134
    .line 135
    const-string v3, "enhance_encrypt_method=1"

    .line 136
    .line 137
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    .line 138
    .line 139
    .line 140
    move-result-object v5

    .line 141
    array-length v5, v5

    .line 142
    add-int/2addr v0, v5

    .line 143
    array-length v5, v1

    .line 144
    add-int/2addr v0, v5

    .line 145
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    array-length v5, v5

    .line 150
    add-int/2addr v0, v5

    .line 151
    new-array v0, v0, [B

    .line 152
    .line 153
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    .line 177
    .line 178
    .line 179
    move-result-object p2

    .line 180
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 181
    .line 182
    .line 183
    new-instance p2, Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 186
    .line 187
    .line 188
    move-result-object p3

    .line 189
    invoke-static {p3, p1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-direct {p2, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    iput-object p2, p0, Lcom/tencent/youtu/sdkkitframework/common/FaceLiveReq;->data:Ljava/lang/String;

    .line 197
    .line 198
    new-instance p1, Lcom/tencent/youtu/sdkkitframework/common/WeJson;

    .line 199
    .line 200
    invoke-direct {p1}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;-><init>()V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1, p0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    return-object p0
.end method

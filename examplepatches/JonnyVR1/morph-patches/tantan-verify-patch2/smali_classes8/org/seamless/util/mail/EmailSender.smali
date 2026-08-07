.class public Lorg/seamless/util/mail/EmailSender;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final host:Ljava/lang/String;

.field protected final password:Ljava/lang/String;

.field protected final properties:Ljava/util/Properties;

.field protected final user:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/Properties;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/seamless/util/mail/EmailSender;->properties:Ljava/util/Properties;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iput-object p1, p0, Lorg/seamless/util/mail/EmailSender;->host:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p2, p0, Lorg/seamless/util/mail/EmailSender;->user:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p3, p0, Lorg/seamless/util/mail/EmailSender;->password:Ljava/lang/String;

    .line 24
    .line 25
    const-string p0, "mail.smtp.port"

    .line 26
    .line 27
    const-string v1, "25"

    .line 28
    .line 29
    invoke-virtual {v0, p0, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    const-string p0, "mail.smtp.socketFactory.fallback"

    .line 33
    .line 34
    const-string v1, "false"

    .line 35
    .line 36
    invoke-virtual {v0, p0, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    const-string p0, "mail.smtp.quitwait"

    .line 40
    .line 41
    invoke-virtual {v0, p0, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    const-string p0, "mail.smtp.host"

    .line 45
    .line 46
    invoke-virtual {v0, p0, p1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    const-string p0, "mail.smtp.starttls.enable"

    .line 50
    .line 51
    const-string p1, "true"

    .line 52
    .line 53
    invoke-virtual {v0, p0, p1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    if-eqz p2, :cond_0

    .line 57
    .line 58
    if-eqz p3, :cond_0

    .line 59
    .line 60
    const-string p0, "mail.smtp.auth"

    .line 61
    .line 62
    invoke-virtual {v0, p0, p1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void

    .line 66
    :cond_1
    const-string p0, "Host is required"

    .line 67
    .line 68
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    const/4 p0, 0x0

    .line 72
    throw p0
.end method


# virtual methods
.method public createConnectedTransport(Ljavax/mail/Session;)Ljavax/mail/Transport;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/mail/MessagingException;
        }
    .end annotation

    .line 1
    const-string v0, "smtp"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljavax/mail/Session;->getTransport(Ljava/lang/String;)Ljavax/mail/Transport;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lorg/seamless/util/mail/EmailSender;->user:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lorg/seamless/util/mail/EmailSender;->password:Ljava/lang/String;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1, v0, p0}, Ljavax/mail/Transport;->connect(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-object p1

    .line 19
    :cond_0
    invoke-virtual {p1}, Ljavax/mail/Transport;->connect()V

    .line 20
    .line 21
    .line 22
    return-object p1
.end method

.method public createContent(Lorg/seamless/util/mail/Email;)Ljavax/mail/Multipart;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/mail/MessagingException;
        }
    .end annotation

    .line 1
    new-instance p0, Ljavax/mail/internet/MimeBodyPart;

    .line 2
    .line 3
    invoke-direct {p0}, Ljavax/mail/internet/MimeBodyPart;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lorg/seamless/util/mail/Email;->getPlaintext()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Ljavax/mail/internet/MimeBodyPart;->setText(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ljavax/mail/internet/MimeMultipart;

    .line 14
    .line 15
    const-string v1, "alternative"

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljavax/mail/internet/MimeMultipart;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljavax/mail/Multipart;->addBodyPart(Ljavax/mail/BodyPart;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Lorg/seamless/util/mail/Email;->getHtml()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    new-instance p0, Ljavax/mail/internet/MimeBodyPart;

    .line 30
    .line 31
    invoke-direct {p0}, Ljavax/mail/internet/MimeBodyPart;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Lorg/seamless/util/mail/Email;->getHtml()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v1, "text/html"

    .line 39
    .line 40
    invoke-virtual {p0, p1, v1}, Ljavax/mail/internet/MimeBodyPart;->setContent(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljavax/mail/Multipart;->addBodyPart(Ljavax/mail/BodyPart;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-object v0
.end method

.method public createSession()Ljavax/mail/Session;
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/seamless/util/mail/EmailSender;->properties:Ljava/util/Properties;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ljavax/mail/Session;->getInstance(Ljava/util/Properties;Ljavax/mail/Authenticator;)Ljavax/mail/Session;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public getHost()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/mail/EmailSender;->host:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/mail/EmailSender;->password:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProperties()Ljava/util/Properties;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/mail/EmailSender;->properties:Ljava/util/Properties;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUser()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/mail/EmailSender;->user:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public send(Lorg/seamless/util/mail/Email;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/mail/MessagingException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/seamless/util/mail/EmailSender;->createSession()Ljavax/mail/Session;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljavax/mail/internet/MimeMessage;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Ljavax/mail/internet/MimeMessage;-><init>(Ljavax/mail/Session;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ljavax/mail/internet/InternetAddress;

    .line 11
    .line 12
    invoke-virtual {p1}, Lorg/seamless/util/mail/Email;->getSender()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-direct {v2, v3}, Ljavax/mail/internet/InternetAddress;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljavax/mail/internet/MimeMessage;->setFrom(Ljavax/mail/Address;)V

    .line 20
    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    new-array v2, v2, [Ljavax/mail/internet/InternetAddress;

    .line 24
    .line 25
    new-instance v3, Ljavax/mail/internet/InternetAddress;

    .line 26
    .line 27
    invoke-virtual {p1}, Lorg/seamless/util/mail/Email;->getRecipient()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-direct {v3, v4}, Ljavax/mail/internet/InternetAddress;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    aput-object v3, v2, v4

    .line 36
    .line 37
    sget-object v3, Ljavax/mail/Message$RecipientType;->TO:Ljavax/mail/Message$RecipientType;

    .line 38
    .line 39
    invoke-virtual {v1, v3, v2}, Ljavax/mail/internet/MimeMessage;->setRecipients(Ljavax/mail/Message$RecipientType;[Ljavax/mail/Address;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Lorg/seamless/util/mail/Email;->getSubject()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v1, v2}, Ljavax/mail/internet/MimeMessage;->setSubject(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Ljava/util/Date;

    .line 50
    .line 51
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ljavax/mail/internet/MimeMessage;->setSentDate(Ljava/util/Date;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1}, Lorg/seamless/util/mail/EmailSender;->createContent(Lorg/seamless/util/mail/Email;)Ljavax/mail/Multipart;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {v1, p1}, Ljavax/mail/internet/MimeMessage;->setContent(Ljavax/mail/Multipart;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v0}, Lorg/seamless/util/mail/EmailSender;->createConnectedTransport(Ljavax/mail/Session;)Ljavax/mail/Transport;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v1}, Ljavax/mail/internet/MimeMessage;->getAllRecipients()[Ljavax/mail/Address;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, v1, p1}, Ljavax/mail/Transport;->sendMessage(Ljavax/mail/Message;[Ljavax/mail/Address;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ljavax/mail/Transport;->close()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

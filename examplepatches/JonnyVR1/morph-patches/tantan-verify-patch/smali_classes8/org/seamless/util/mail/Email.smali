.class public Lorg/seamless/util/mail/Email;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected html:Ljava/lang/String;

.field protected plaintext:Ljava/lang/String;

.field protected recipient:Ljava/lang/String;

.field protected sender:Ljava/lang/String;

.field protected subject:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 15
    invoke-direct/range {v0 .. v5}, Lorg/seamless/util/mail/Email;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/seamless/util/mail/Email;->sender:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/seamless/util/mail/Email;->recipient:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/seamless/util/mail/Email;->subject:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lorg/seamless/util/mail/Email;->plaintext:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, Lorg/seamless/util/mail/Email;->html:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getHtml()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/mail/Email;->html:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPlaintext()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/mail/Email;->plaintext:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecipient()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/mail/Email;->recipient:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSender()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/mail/Email;->sender:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSubject()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/mail/Email;->subject:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setHtml(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/seamless/util/mail/Email;->html:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPlaintext(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/seamless/util/mail/Email;->plaintext:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRecipient(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/seamless/util/mail/Email;->recipient:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSender(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/seamless/util/mail/Email;->sender:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSubject(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/seamless/util/mail/Email;->subject:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.class public Ll/hbl0;
.super Ll/lbl0;
.source "SourceFile"


# instance fields
.field public final a:Ll/x20;


# direct methods
.method public constructor <init>(Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lbl0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hbl0;->a:Ll/x20;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/lbl0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/hbl0;->a:Ll/x20;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/x20;->call()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "VideoChatActionChecker"

    .line 2
    .line 3
    return-object p0
.end method

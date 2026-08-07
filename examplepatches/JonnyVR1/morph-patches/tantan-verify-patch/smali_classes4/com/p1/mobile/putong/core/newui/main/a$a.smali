.class public Lcom/p1/mobile/putong/core/newui/main/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/main/a;->U6()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/main/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/main/a;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/a$a;->b:Lcom/p1/mobile/putong/core/newui/main/a;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/main/a$a;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/a$a;->a:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/a0g;->H()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "aiPictureDlg"

    .line 10
    .line 11
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a$a;->b:Lcom/p1/mobile/putong/core/newui/main/a;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "netPictureDlg"

    .line 25
    .line 26
    invoke-static {p0, p1}, Ll/a0g;->S(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a$a;->a(Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

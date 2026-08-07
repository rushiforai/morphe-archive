.class public Ll/och0$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/och0;->g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChatPartners;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/och0$d;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 4
    .line 5
    iget-object p1, p1, Ll/j7b;->Z:Ll/wyd0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/CharSequence;

    .line 12
    .line 13
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/och0$d;->a:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    instance-of p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 26
    .line 27
    invoke-static {p0}, Ll/och0;->f(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

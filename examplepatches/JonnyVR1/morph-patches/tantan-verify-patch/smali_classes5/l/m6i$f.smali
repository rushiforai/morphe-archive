.class public Ll/m6i$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zvk$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/m6i;->f(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Landroid/view/View;Lcom/p1/mobile/putong/core/data/PopGuide;)V
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
    iput-object p1, p0, Ll/m6i$f;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    sput-boolean p1, Ll/m6i;->h:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/m6i$f;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    instance-of p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->R5(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-static {}, Ll/m6i;->d()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

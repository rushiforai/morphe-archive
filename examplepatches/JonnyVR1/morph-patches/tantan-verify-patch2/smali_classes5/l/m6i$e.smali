.class public Ll/m6i$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zvk$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/m6i;->f(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Landroid/view/View;Lcom/p1/mobile/putong/core/data/PopGuide;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


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


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-boolean p0, Ll/m6i;->h:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    sput-boolean p0, Ll/m6i;->h:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {}, Ll/m6i;->c()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.class public final synthetic Ll/jjl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Landroid/view/ViewGroup;

.field public final synthetic b:Ll/ljl0;

.field public final synthetic c:Lcom/clevertap/android/sdk/inapp/pipsdk/a;


# direct methods
.method public synthetic constructor <init>(Landroid/view/ViewGroup;Ll/ljl0;Lcom/clevertap/android/sdk/inapp/pipsdk/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jjl0;->a:Landroid/view/ViewGroup;

    iput-object p2, p0, Ll/jjl0;->b:Ll/ljl0;

    iput-object p3, p0, Ll/jjl0;->c:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jjl0;->a:Landroid/view/ViewGroup;

    iget-object v1, p0, Ll/jjl0;->b:Ll/ljl0;

    iget-object p0, p0, Ll/jjl0;->c:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    check-cast p1, Landroidx/media3/common/PlaybackException;

    invoke-static {v0, v1, p0, p1}, Ll/ljl0;->i(Landroid/view/ViewGroup;Ll/ljl0;Lcom/clevertap/android/sdk/inapp/pipsdk/a;Landroidx/media3/common/PlaybackException;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

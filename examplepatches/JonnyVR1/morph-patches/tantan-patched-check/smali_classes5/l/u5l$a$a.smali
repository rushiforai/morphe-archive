.class public Ll/u5l$a$a;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/u5l$a;->g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/u5l$a;


# direct methods
.method public constructor <init>(Ll/u5l$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5l$a$a;->a:Ll/u5l$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u5l$a$a;->a:Ll/u5l$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/u5l$a;->a:Ll/u5l;

    .line 4
    .line 5
    invoke-static {p0}, Ll/u5l;->Z(Ll/u5l;)Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-static {p0}, Ll/w20;->b(Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

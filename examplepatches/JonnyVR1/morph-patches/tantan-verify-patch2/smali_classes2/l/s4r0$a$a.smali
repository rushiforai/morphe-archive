.class Ll/s4r0$a$a;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/s4r0$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/s4r0$a;


# direct methods
.method public constructor <init>(Ll/s4r0$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s4r0$a$a;->a:Ll/s4r0$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/s4r0;->f(Z)Z

    .line 3
    .line 4
    .line 5
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->s()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

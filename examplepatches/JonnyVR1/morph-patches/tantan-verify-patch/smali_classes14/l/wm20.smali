.class public final synthetic Ll/wm20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ym20$a;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ym20$a;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wm20;->a:Ll/ym20$a;

    iput p2, p0, Ll/wm20;->b:I

    iput-object p3, p0, Ll/wm20;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wm20;->a:Ll/ym20$a;

    iget v1, p0, Ll/wm20;->b:I

    iget-object p0, p0, Ll/wm20;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/ym20$a;->b(Ll/ym20$a;ILjava/lang/String;)V

    return-void
.end method

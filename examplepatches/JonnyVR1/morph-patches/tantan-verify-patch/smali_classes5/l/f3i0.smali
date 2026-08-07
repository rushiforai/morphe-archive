.class public final synthetic Ll/f3i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/e3i0$d;

.field public final synthetic b:Ll/e3i0$c;


# direct methods
.method public synthetic constructor <init>(Ll/e3i0$d;Ll/e3i0$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f3i0;->a:Ll/e3i0$d;

    iput-object p2, p0, Ll/f3i0;->b:Ll/e3i0$c;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f3i0;->a:Ll/e3i0$d;

    iget-object p0, p0, Ll/f3i0;->b:Ll/e3i0$c;

    invoke-static {v0, p0}, Ll/e3i0$d;->a(Ll/e3i0$d;Ll/e3i0$c;)V

    return-void
.end method

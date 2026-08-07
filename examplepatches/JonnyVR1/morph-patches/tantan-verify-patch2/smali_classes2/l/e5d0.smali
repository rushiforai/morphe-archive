.class public final synthetic Ll/e5d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/c5d0$e;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/c5d0$e;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e5d0;->a:Ll/c5d0$e;

    iput p2, p0, Ll/e5d0;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e5d0;->a:Ll/c5d0$e;

    iget p0, p0, Ll/e5d0;->b:I

    invoke-static {v0, p0}, Ll/c5d0$e;->b(Ll/c5d0$e;I)V

    return-void
.end method

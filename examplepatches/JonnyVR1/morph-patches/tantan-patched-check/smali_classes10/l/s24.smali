.class public final synthetic Ll/s24;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/t24;

.field public final synthetic b:Ll/qy3;


# direct methods
.method public synthetic constructor <init>(Ll/t24;Ll/qy3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s24;->a:Ll/t24;

    iput-object p2, p0, Ll/s24;->b:Ll/qy3;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s24;->a:Ll/t24;

    iget-object p0, p0, Ll/s24;->b:Ll/qy3;

    invoke-static {v0, p0}, Ll/t24;->b(Ll/t24;Ll/qy3;)V

    return-void
.end method

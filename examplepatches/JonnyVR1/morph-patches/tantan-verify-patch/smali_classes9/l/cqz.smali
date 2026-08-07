.class public final synthetic Ll/cqz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tvz;

.field public final synthetic b:Ll/bkj0;


# direct methods
.method public synthetic constructor <init>(Ll/tvz;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cqz;->a:Ll/tvz;

    iput-object p2, p0, Ll/cqz;->b:Ll/bkj0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cqz;->a:Ll/tvz;

    iget-object p0, p0, Ll/cqz;->b:Ll/bkj0;

    invoke-static {v0, p0}, Ll/tvz;->U7(Ll/tvz;Ll/bkj0;)V

    return-void
.end method

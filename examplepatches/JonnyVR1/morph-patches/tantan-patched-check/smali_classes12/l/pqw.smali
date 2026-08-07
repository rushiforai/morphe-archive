.class public final synthetic Ll/pqw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qqw;

.field public final synthetic b:Ll/fzv;


# direct methods
.method public synthetic constructor <init>(Ll/qqw;Ll/fzv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pqw;->a:Ll/qqw;

    iput-object p2, p0, Ll/pqw;->b:Ll/fzv;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pqw;->a:Ll/qqw;

    iget-object p0, p0, Ll/pqw;->b:Ll/fzv;

    invoke-static {v0, p0}, Ll/qqw;->d(Ll/qqw;Ll/fzv;)V

    return-void
.end method

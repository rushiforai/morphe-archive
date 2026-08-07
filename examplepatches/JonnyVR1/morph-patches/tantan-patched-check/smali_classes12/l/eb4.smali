.class public final synthetic Ll/eb4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fb4;

.field public final synthetic b:Ll/v94;


# direct methods
.method public synthetic constructor <init>(Ll/fb4;Ll/v94;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eb4;->a:Ll/fb4;

    iput-object p2, p0, Ll/eb4;->b:Ll/v94;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eb4;->a:Ll/fb4;

    iget-object p0, p0, Ll/eb4;->b:Ll/v94;

    invoke-static {v0, p0}, Ll/fb4;->p(Ll/fb4;Ll/v94;)V

    return-void
.end method

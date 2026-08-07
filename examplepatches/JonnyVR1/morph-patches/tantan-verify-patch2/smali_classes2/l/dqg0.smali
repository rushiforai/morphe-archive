.class public final synthetic Ll/dqg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/asg0;

.field public final synthetic b:Ljava/lang/Exception;


# direct methods
.method public synthetic constructor <init>(Ll/asg0;Ljava/lang/Exception;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dqg0;->a:Ll/asg0;

    iput-object p2, p0, Ll/dqg0;->b:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dqg0;->a:Ll/asg0;

    iget-object p0, p0, Ll/dqg0;->b:Ljava/lang/Exception;

    invoke-virtual {v0, p0}, Ll/asg0;->a(Ljava/lang/Exception;)V

    return-void
.end method

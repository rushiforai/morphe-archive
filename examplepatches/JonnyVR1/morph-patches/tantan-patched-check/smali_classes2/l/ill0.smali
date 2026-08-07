.class public final synthetic Ll/ill0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/lll0;

.field public final synthetic b:Ljava/util/TimerTask;


# direct methods
.method public synthetic constructor <init>(Ll/lll0;Ljava/util/TimerTask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ill0;->a:Ll/lll0;

    iput-object p2, p0, Ll/ill0;->b:Ljava/util/TimerTask;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ill0;->a:Ll/lll0;

    iget-object p0, p0, Ll/ill0;->b:Ljava/util/TimerTask;

    invoke-static {v0, p0}, Ll/lll0;->b(Ll/lll0;Ljava/util/TimerTask;)V

    return-void
.end method

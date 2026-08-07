.class public final synthetic Ll/gt50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jl80;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/jl80;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gt50;->a:Ll/jl80;

    iput-object p2, p0, Ll/gt50;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gt50;->a:Ll/jl80;

    iget-object p0, p0, Ll/gt50;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b(Ll/jl80;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

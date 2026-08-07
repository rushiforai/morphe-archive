.class public final synthetic Ll/kgj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;

.field public final synthetic b:Ll/lgj0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Ll/lgj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kgj0;->a:Ljava/lang/Runnable;

    iput-object p2, p0, Ll/kgj0;->b:Ll/lgj0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kgj0;->a:Ljava/lang/Runnable;

    iget-object p0, p0, Ll/kgj0;->b:Ll/lgj0;

    invoke-static {v0, p0}, Ll/lgj0;->b(Ljava/lang/Runnable;Ll/lgj0;)V

    return-void
.end method

.class public final synthetic Ll/hyv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/iyv;

.field public final synthetic b:Ljava/util/concurrent/Callable;


# direct methods
.method public synthetic constructor <init>(Ll/iyv;Ljava/util/concurrent/Callable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hyv;->a:Ll/iyv;

    iput-object p2, p0, Ll/hyv;->b:Ljava/util/concurrent/Callable;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hyv;->a:Ll/iyv;

    iget-object p0, p0, Ll/hyv;->b:Ljava/util/concurrent/Callable;

    invoke-static {v0, p0}, Ll/iyv;->a(Ll/iyv;Ljava/util/concurrent/Callable;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.class public final synthetic Ll/k7h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/n7h;

.field public final synthetic b:Ll/jhk;

.field public final synthetic c:Ll/yah;


# direct methods
.method public synthetic constructor <init>(Ll/n7h;Ll/jhk;Ll/yah;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k7h;->a:Ll/n7h;

    iput-object p2, p0, Ll/k7h;->b:Ll/jhk;

    iput-object p3, p0, Ll/k7h;->c:Ll/yah;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k7h;->a:Ll/n7h;

    iget-object v1, p0, Ll/k7h;->b:Ll/jhk;

    iget-object p0, p0, Ll/k7h;->c:Ll/yah;

    invoke-static {v0, v1, p0}, Ll/n7h;->h(Ll/n7h;Ll/jhk;Ll/yah;)V

    return-void
.end method

.class public final synthetic Ll/oq50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/pq50;


# direct methods
.method public synthetic constructor <init>(Ll/pq50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oq50;->a:Ll/pq50;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oq50;->a:Ll/pq50;

    invoke-static {p0}, Ll/pq50;->h(Ll/pq50;)V

    return-void
.end method

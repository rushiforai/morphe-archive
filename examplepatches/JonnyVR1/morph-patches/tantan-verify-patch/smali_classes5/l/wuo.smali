.class public final synthetic Ll/wuo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hvo;

.field public final synthetic b:D


# direct methods
.method public synthetic constructor <init>(Ll/hvo;D)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wuo;->a:Ll/hvo;

    iput-wide p2, p0, Ll/wuo;->b:D

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wuo;->a:Ll/hvo;

    iget-wide v1, p0, Ll/wuo;->b:D

    invoke-static {v0, v1, v2}, Ll/hvo;->k(Ll/hvo;D)V

    return-void
.end method

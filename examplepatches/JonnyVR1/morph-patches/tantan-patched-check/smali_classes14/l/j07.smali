.class public final synthetic Ll/j07;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ll/s07;


# direct methods
.method public synthetic constructor <init>(JLl/s07;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/j07;->a:J

    iput-object p3, p0, Ll/j07;->b:Ll/s07;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/j07;->a:J

    iget-object p0, p0, Ll/j07;->b:Ll/s07;

    invoke-static {v0, v1, p0}, Ll/s07;->a3(JLl/s07;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

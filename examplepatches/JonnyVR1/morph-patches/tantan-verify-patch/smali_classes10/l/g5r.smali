.class public final synthetic Ll/g5r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:J

.field public final synthetic d:J


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g5r;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/g5r;->b:Ljava/lang/String;

    iput-wide p3, p0, Ll/g5r;->c:J

    iput-wide p5, p0, Ll/g5r;->d:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/g5r;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/g5r;->b:Ljava/lang/String;

    iget-wide v2, p0, Ll/g5r;->c:J

    iget-wide v4, p0, Ll/g5r;->d:J

    move-object v6, p1

    check-cast v6, Ll/dn50;

    invoke-static/range {v0 .. v6}, Ll/r5r;->a1(Ljava/lang/String;Ljava/lang/String;JJLl/dn50;)V

    return-void
.end method

.class public final synthetic Ll/e5r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r5r;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Ll/r5r;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e5r;->a:Ll/r5r;

    iput-object p2, p0, Ll/e5r;->b:Ljava/lang/String;

    iput-wide p3, p0, Ll/e5r;->c:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e5r;->a:Ll/r5r;

    iget-object v1, p0, Ll/e5r;->b:Ljava/lang/String;

    iget-wide v2, p0, Ll/e5r;->c:J

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, v2, v3, p1}, Ll/r5r;->c1(Ll/r5r;Ljava/lang/String;JLjava/lang/Long;)V

    return-void
.end method

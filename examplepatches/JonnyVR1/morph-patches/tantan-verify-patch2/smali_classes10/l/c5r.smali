.class public final synthetic Ll/c5r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/r5r;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Ll/r5r;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c5r;->a:Ll/r5r;

    iput-object p2, p0, Ll/c5r;->b:Ljava/lang/String;

    iput-wide p3, p0, Ll/c5r;->c:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/c5r;->a:Ll/r5r;

    iget-object v1, p0, Ll/c5r;->b:Ljava/lang/String;

    iget-wide v2, p0, Ll/c5r;->c:J

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, v2, v3, p1}, Ll/r5r;->d1(Ll/r5r;Ljava/lang/String;JLjava/lang/Long;)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

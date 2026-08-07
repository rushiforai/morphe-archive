.class public final synthetic Ll/ga3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ha3;

.field public final synthetic b:J

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/ha3;JLl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ga3;->a:Ll/ha3;

    iput-wide p2, p0, Ll/ga3;->b:J

    iput-object p4, p0, Ll/ga3;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ga3;->a:Ll/ha3;

    iget-wide v1, p0, Ll/ga3;->b:J

    iget-object p0, p0, Ll/ga3;->c:Ll/x20;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, v2, p0, p1}, Ll/ha3;->J3(Ll/ha3;JLl/x20;Ljava/lang/Long;)V

    return-void
.end method

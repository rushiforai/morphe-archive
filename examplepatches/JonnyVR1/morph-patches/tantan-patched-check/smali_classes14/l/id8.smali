.class public final synthetic Ll/id8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(JLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/id8;->a:J

    iput-object p3, p0, Ll/id8;->b:Ljava/lang/String;

    iput-object p4, p0, Ll/id8;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-wide v0, p0, Ll/id8;->a:J

    iget-object v2, p0, Ll/id8;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/id8;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Ll/sd8;->a3(JLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

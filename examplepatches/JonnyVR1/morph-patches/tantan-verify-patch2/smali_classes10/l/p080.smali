.class public final synthetic Ll/p080;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/b180;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ll/b180;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p080;->a:Ll/b180;

    iput-wide p2, p0, Ll/p080;->b:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p080;->a:Ll/b180;

    iget-wide v1, p0, Ll/p080;->b:J

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, v1, v2, p1, p2}, Ll/b180;->a4(Ll/b180;JLjava/lang/Integer;Ljava/lang/Object;)V

    return-void
.end method

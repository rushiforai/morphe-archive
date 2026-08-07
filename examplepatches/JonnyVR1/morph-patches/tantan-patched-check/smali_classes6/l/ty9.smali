.class public final synthetic Ll/ty9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ty9;->a:Ljava/lang/String;

    iput-wide p2, p0, Ll/ty9;->b:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ty9;->a:Ljava/lang/String;

    iget-wide v1, p0, Ll/ty9;->b:J

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, v2, p1}, Lcom/p1/mobile/putong/feed/api/b;->E1(Ljava/lang/String;JLl/uxj0;)V

    return-void
.end method

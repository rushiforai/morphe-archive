.class public final synthetic Ll/xuv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zuv0;

.field public final synthetic b:J

.field public final synthetic c:Ll/wuv0;


# direct methods
.method public synthetic constructor <init>(Ll/zuv0;JLl/wuv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xuv0;->a:Ll/zuv0;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/xuv0;->b:J

    .line 7
    .line 8
    iput-object p4, p0, Ll/xuv0;->c:Ll/wuv0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xuv0;->a:Ll/zuv0;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/xuv0;->b:J

    .line 4
    .line 5
    iget-object p0, p0, Ll/xuv0;->c:Ll/wuv0;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2, p0}, Ll/zuv0;->b(JLl/wuv0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

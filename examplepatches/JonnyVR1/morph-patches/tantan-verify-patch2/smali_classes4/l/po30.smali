.class public final synthetic Ll/po30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/so30;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ll/so30;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/po30;->a:Ll/so30;

    iput-wide p2, p0, Ll/po30;->b:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/po30;->a:Ll/so30;

    iget-wide v1, p0, Ll/po30;->b:J

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, v2, p1}, Ll/so30;->l2(Ll/so30;JLjava/lang/Long;)V

    return-void
.end method

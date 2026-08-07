.class public final synthetic Ll/zah;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kbh;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ll/kbh;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zah;->a:Ll/kbh;

    iput-wide p2, p0, Ll/zah;->b:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zah;->a:Ll/kbh;

    iget-wide v1, p0, Ll/zah;->b:J

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, v2, p1}, Ll/kbh;->L(Ll/kbh;JLl/pf60;)V

    return-void
.end method

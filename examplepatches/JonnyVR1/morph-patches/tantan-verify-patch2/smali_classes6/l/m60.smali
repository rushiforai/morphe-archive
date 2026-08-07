.class public final synthetic Ll/m60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o60;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ll/o60;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m60;->a:Ll/o60;

    iput-wide p2, p0, Ll/m60;->b:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m60;->a:Ll/o60;

    iget-wide v1, p0, Ll/m60;->b:J

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, v2, p1}, Ll/o60;->C(Ll/o60;JLl/pf60;)V

    return-void
.end method

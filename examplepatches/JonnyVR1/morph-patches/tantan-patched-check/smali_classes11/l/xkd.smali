.class public final synthetic Ll/xkd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:J

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;JI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xkd;->a:Ll/hk0$a;

    iput-wide p2, p0, Ll/xkd;->b:J

    iput p4, p0, Ll/xkd;->c:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xkd;->a:Ll/hk0$a;

    iget-wide v1, p0, Ll/xkd;->b:J

    iget p0, p0, Ll/xkd;->c:I

    check-cast p1, Ll/hk0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/wld;->x0(Ll/hk0$a;JILl/hk0;)V

    return-void
.end method

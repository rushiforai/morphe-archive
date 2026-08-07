.class public final synthetic Ll/fw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:J


# direct methods
.method public synthetic constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/fw;->a:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/fw;->a:J

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p1}, Ll/pw;->o(JLjava/util/List;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method

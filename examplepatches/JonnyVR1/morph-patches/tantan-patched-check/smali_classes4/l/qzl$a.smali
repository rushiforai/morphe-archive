.class public Ll/qzl$a;
.super Ll/zwd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qzl;->h(Ljava/lang/String;Ll/utl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/zwd0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic i:Ll/qzl;


# direct methods
.method public constructor <init>(Ll/qzl;Ljava/lang/String;Ll/utl;JJI)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qzl$a;->i:Ll/qzl;

    .line 2
    .line 3
    move-object p1, p2

    .line 4
    move-object p2, p3

    .line 5
    move-wide p3, p4

    .line 6
    move-wide p5, p6

    .line 7
    move p7, p8

    .line 8
    invoke-direct/range {p0 .. p7}, Ll/zwd0;-><init>(Ljava/lang/String;Ll/utl;JJI)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public i()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qzl$a;->i:Ll/qzl;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qzl;->f()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

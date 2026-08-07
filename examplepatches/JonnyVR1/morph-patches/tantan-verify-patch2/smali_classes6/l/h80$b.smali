.class public Ll/h80$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/h80;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TYPE:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Ll/h80$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "TDATA;>.b<TTYPE;>;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TTYPE;"
        }
    .end annotation
.end field

.field public final synthetic c:Ll/h80;


# direct methods
.method public constructor <init>(Ll/h80;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTYPE;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/h80$b;->c:Ll/h80;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.class public Ll/h80$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/h80;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public b:J

.field public c:I

.field public d:I

.field public e:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TDATA;"
        }
    .end annotation
.end field

.field public final synthetic f:Ll/h80;


# direct methods
.method public constructor <init>(Ll/h80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h80$a;->f:Ll/h80;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/h80;Ll/i80;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/h80$a;-><init>(Ll/h80;)V

    return-void
.end method

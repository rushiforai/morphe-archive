.class public Ll/emg$a;
.super Ll/vbh;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/emg;->f()Ll/zxh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic c:Ll/emg;


# direct methods
.method public constructor <init>(Ll/emg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/emg$a;->c:Ll/emg;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/vbh;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/emg$a;->c:Ll/emg;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/emg;->g()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

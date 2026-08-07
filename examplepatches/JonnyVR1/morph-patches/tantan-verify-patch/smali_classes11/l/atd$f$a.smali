.class public Ll/atd$f$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/Spatializer$OnSpatializerStateChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/atd$f;->b(Ll/atd;Landroid/os/Looper;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/atd;

.field public final synthetic b:Ll/atd$f;


# direct methods
.method public constructor <init>(Ll/atd$f;Ll/atd;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/atd$f$a;->b:Ll/atd$f;

    .line 2
    .line 3
    iput-object p2, p0, Ll/atd$f$a;->a:Ll/atd;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onSpatializerAvailableChanged(Landroid/media/Spatializer;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/atd$f$a;->a:Ll/atd;

    .line 2
    .line 3
    invoke-static {p0}, Ll/atd;->C(Ll/atd;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onSpatializerEnabledChanged(Landroid/media/Spatializer;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/atd$f$a;->a:Ll/atd;

    .line 2
    .line 3
    invoke-static {p0}, Ll/atd;->C(Ll/atd;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.class public final Lyl8;
.super Lxl8;
.source "SourceFile"


# instance fields
.field public final d:Ltcc;

.field public final e:Lsxh;


# direct methods
.method public constructor <init>(Ll2b;Landroid/app/PendingIntent;Ltcc;Lsxh;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Lxl8;-><init>(Ldx3;Landroid/app/PendingIntent;)V

    iput-object p3, p0, Lyl8;->d:Ltcc;

    iput-object p4, p0, Lyl8;->e:Lsxh;

    invoke-virtual {p3, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.class public final Lxle;
.super Lp58;
.source "SourceFile"


# static fields
.field public static final b:Lxle;

.field public static final c:Lxle;

.field public static final d:Lxle;

.field public static final e:Lxle;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 2

    new-instance v0, Lxle;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lp58;-><init>(Z)V

    sput-object v0, Lxle;->b:Lxle;

    new-instance v0, Lxle;

    invoke-direct {v0, v1}, Lp58;-><init>(Z)V

    sput-object v0, Lxle;->c:Lxle;

    new-instance v0, Lxle;

    invoke-direct {v0, v1}, Lp58;-><init>(Z)V

    sput-object v0, Lxle;->d:Lxle;

    new-instance v0, Lxle;

    invoke-direct {v0, v1}, Lp58;-><init>(Z)V

    sput-object v0, Lxle;->e:Lxle;

    return-void
.end method

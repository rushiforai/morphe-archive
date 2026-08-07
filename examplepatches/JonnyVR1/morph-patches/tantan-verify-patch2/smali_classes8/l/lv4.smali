.class public final synthetic Ll/lv4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:[J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;[J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lv4;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/lv4;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/lv4;->c:[J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lv4;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/lv4;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/lv4;->c:[J

    invoke-static {v0, v1, p0}, Ll/ov4;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;[J)V

    return-void
.end method

.class public final Lcom/opera/android/touch/a;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:Lpc9;


# direct methods
.method public constructor <init>(Lpc9;)V
    .registers 2

    iput-object p1, p0, Lcom/opera/android/touch/a;->e:Lpc9;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .registers 4

    iget-object p0, p0, Lcom/opera/android/touch/a;->e:Lpc9;

    iget-object p0, p0, Lpc9;->a:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-class v0, Lcom/opera/android/touch/MessageDatabase;

    const-string v1, "flow_messages"

    invoke-static {p0, v0, v1}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object p0

    const/4 v0, 0x3

    new-array v0, v0, [Lryd;

    sget-object v1, Lcom/opera/android/touch/MessageDatabase;->l:Lczd;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/touch/MessageDatabase;->m:Lczd;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/opera/android/touch/MessageDatabase;->n:Lczd;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    invoke-virtual {p0, v0}, Lu5i;->a([Lryd;)V

    invoke-virtual {p0}, Lu5i;->b()Ly5i;

    move-result-object p0

    check-cast p0, Lcom/opera/android/touch/MessageDatabase;

    invoke-virtual {p0}, Lcom/opera/android/touch/MessageDatabase;->x()Ljvd;

    move-result-object p0

    return-object p0
.end method

.class public final Lvk6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lrv0;

.field public final b:Lumi;

.field public final c:Lqie;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 7

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-class v0, Lcom/opera/android/aiassistant/db/AiAssistantDatabase;

    const-string v1, "ai_assistant"

    invoke-static {p1, v0, v1}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object p1

    const/4 v0, 0x1

    new-array v1, v0, [Lryd;

    const/4 v2, 0x0

    sget-object v3, Lcom/opera/android/aiassistant/db/AiAssistantDatabase;->l:Lczd;

    aput-object v3, v1, v2

    invoke-virtual {p1, v1}, Lu5i;->a([Lryd;)V

    new-array v0, v0, [Lryd;

    sget-object v1, Lcom/opera/android/aiassistant/db/AiAssistantDatabase;->m:Lczd;

    aput-object v1, v0, v2

    invoke-virtual {p1, v0}, Lu5i;->a([Lryd;)V

    invoke-virtual {p1}, Lu5i;->b()Ly5i;

    move-result-object p1

    check-cast p1, Lcom/opera/android/aiassistant/db/AiAssistantDatabase;

    invoke-virtual {p1}, Lcom/opera/android/aiassistant/db/AiAssistantDatabase;->x()Lrv0;

    move-result-object p1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvk6;->a:Lrv0;

    iput-object p2, p0, Lvk6;->b:Lumi;

    new-instance p1, Lqie;

    const/16 p2, 0x13

    invoke-direct {p1, p2}, Lqie;-><init>(B)V

    iput-object p1, p0, Lvk6;->c:Lqie;

    return-void
.end method

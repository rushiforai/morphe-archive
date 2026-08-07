.class public Lcom/xiaomi/push/service/h;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Lcom/xiaomi/push/service/u;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/xiaomi/push/service/u;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/xiaomi/push/service/u;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/xiaomi/push/service/h;->a:Lcom/xiaomi/push/service/u;

    .line 10
    .line 11
    return-void
.end method

.method public static a(Lcom/xiaomi/push/service/am$b;)Ljava/lang/String;
    .locals 2

    .line 329
    const-string v0, "9"

    iget-object v1, p0, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 330
    iget-object p0, p0, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 331
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".permission.MIPUSH_RECEIVE"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 332
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".permission.MIMC_RECEIVE"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static a(Landroid/content/Context;Landroid/content/Intent;Lcom/xiaomi/push/service/am$b;)V
    .locals 2

    .line 326
    const-string v0, "com.xiaomi.xmsf"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 327
    invoke-virtual {p0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void

    .line 328
    :cond_0
    invoke-static {p2}, Lcom/xiaomi/push/service/h;->a(Lcom/xiaomi/push/service/am$b;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public a(Ll/g2r0;)Lcom/xiaomi/push/service/am$b;
    .locals 4

    .line 292
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    move-result-object p0

    .line 293
    invoke-virtual {p1}, Ll/g2r0;->m()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object p0

    .line 294
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 295
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 296
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result p0

    const/4 v2, 0x1

    if-ne p0, v2, :cond_1

    .line 297
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/push/service/am$b;

    return-object p0

    .line 298
    :cond_1
    invoke-virtual {p1}, Ll/g2r0;->q()Ljava/lang/String;

    move-result-object p0

    .line 299
    invoke-virtual {p1}, Ll/g2r0;->o()Ljava/lang/String;

    move-result-object p1

    .line 300
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 301
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/push/service/am$b;

    .line 302
    iget-object v3, v2, Lcom/xiaomi/push/service/am$b;->b:Ljava/lang/String;

    invoke-static {p0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, v2, Lcom/xiaomi/push/service/am$b;->b:Ljava/lang/String;

    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    :cond_3
    return-object v2

    :cond_4
    return-object v1
.end method

.method public a(Ll/w0r0;)Lcom/xiaomi/push/service/am$b;
    .locals 3

    .line 303
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    move-result-object p0

    .line 304
    invoke-virtual {p1}, Ll/w0r0;->a()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object p0

    .line 305
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 306
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 307
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result p0

    const/4 v2, 0x1

    if-ne p0, v2, :cond_1

    .line 308
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/push/service/am$b;

    return-object p0

    .line 309
    :cond_1
    invoke-virtual {p1}, Ll/w0r0;->F()Ljava/lang/String;

    move-result-object p0

    .line 310
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 311
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/xiaomi/push/service/am$b;

    .line 312
    iget-object v2, p1, Lcom/xiaomi/push/service/am$b;->b:Ljava/lang/String;

    invoke-static {p0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    return-object p1

    :cond_3
    return-object v1
.end method

.method public a(Landroid/content/Context;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 284
    const-string p0, "com.xiaomi.xmsf"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 285
    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 286
    const-string v0, "com.xiaomi.push.service_started"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 287
    invoke-static {}, Ll/l4r0;->r()Z

    move-result v0

    if-eqz v0, :cond_0

    const/high16 v0, 0x1000000

    .line 288
    invoke-virtual {p0, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 289
    :cond_0
    const-string v0, "[Bcst] send ***.push.service_started broadcast to inform push service has started."

    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 290
    const-string v0, "com.android.mms"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 291
    invoke-virtual {p1, p0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_1
    return-void
.end method

.method public a(Landroid/content/Context;Lcom/xiaomi/push/service/am$b;I)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .line 241
    const-string p0, "5"

    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    return-void

    .line 242
    :cond_0
    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 243
    const-string v0, "com.xiaomi.push.channel_closed"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 244
    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 245
    sget-object v0, Lcom/xiaomi/push/service/an;->v:Ljava/lang/String;

    iget-object v1, p2, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 246
    const-string v0, "ext_reason"

    invoke-virtual {p0, v0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 247
    sget-object v0, Lcom/xiaomi/push/service/an;->s:Ljava/lang/String;

    iget-object v1, p2, Lcom/xiaomi/push/service/am$b;->b:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 248
    sget-object v0, Lcom/xiaomi/push/service/an;->J:Ljava/lang/String;

    iget-object v1, p2, Lcom/xiaomi/push/service/am$b;->i:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 249
    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/Messenger;

    if-eqz v0, :cond_1

    const-string v0, "9"

    iget-object v1, p2, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 p1, 0x11

    const/4 p3, 0x0

    .line 250
    invoke-static {p3, p1, p0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    .line 251
    :try_start_0
    iget-object p1, p2, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/Messenger;

    invoke-virtual {p1, p0}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 252
    :catch_0
    iput-object p3, p2, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/Messenger;

    .line 253
    iget-object p0, p2, Lcom/xiaomi/push/service/am$b;->b:Ljava/lang/String;

    const/16 p1, 0x40

    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "peer may died: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return-void

    .line 254
    :cond_1
    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    iget-object v1, p2, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    .line 255
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    filled-new-array {v0, v1, p3}, [Ljava/lang/Object;

    move-result-object p3

    .line 256
    const-string v0, "[Bcst] notify channel closed. %s,%s,%d"

    invoke-static {v0, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 257
    invoke-static {p1, p0, p2}, Lcom/xiaomi/push/service/h;->a(Landroid/content/Context;Landroid/content/Intent;Lcom/xiaomi/push/service/am$b;)V

    return-void
.end method

.method public a(Landroid/content/Context;Lcom/xiaomi/push/service/am$b;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    if-nez p2, :cond_0

    .line 313
    const-string p0, "error while notify kick by server!"

    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    return-void

    .line 314
    :cond_0
    const-string p0, "5"

    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 315
    const-string p0, "mipush kicked by server"

    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    return-void

    .line 316
    :cond_1
    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 317
    const-string v0, "com.xiaomi.push.kicked"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 318
    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 319
    const-string v0, "ext_kick_type"

    invoke-virtual {p0, v0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 320
    const-string p3, "ext_kick_reason"

    invoke-virtual {p0, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 321
    const-string p3, "ext_chid"

    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    invoke-virtual {p0, p3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 322
    sget-object p3, Lcom/xiaomi/push/service/an;->s:Ljava/lang/String;

    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->b:Ljava/lang/String;

    invoke-virtual {p0, p3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 323
    sget-object p3, Lcom/xiaomi/push/service/an;->J:Ljava/lang/String;

    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->i:Ljava/lang/String;

    invoke-virtual {p0, p3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 324
    iget-object p3, p2, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    filled-new-array {p3, v0, p4}, [Ljava/lang/Object;

    move-result-object p3

    const-string p4, "[Bcst] notify packet(blob) arrival. %s,%s,%s"

    invoke-static {p4, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 325
    invoke-static {p1, p0, p2}, Lcom/xiaomi/push/service/h;->a(Landroid/content/Context;Landroid/content/Intent;Lcom/xiaomi/push/service/am$b;)V

    return-void
.end method

.method public a(Landroid/content/Context;Lcom/xiaomi/push/service/am$b;ZILjava/lang/String;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .line 224
    const-string v0, "5"

    iget-object v1, p2, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 225
    iget-object p0, p0, Lcom/xiaomi/push/service/h;->a:Lcom/xiaomi/push/service/u;

    invoke-virtual/range {p0 .. p5}, Lcom/xiaomi/push/service/u;->a(Landroid/content/Context;Lcom/xiaomi/push/service/am$b;ZILjava/lang/String;)V

    return-void

    .line 226
    :cond_0
    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 227
    const-string v0, "com.xiaomi.push.channel_opened"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 228
    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 229
    const-string v0, "ext_succeeded"

    invoke-virtual {p0, v0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    if-nez p3, :cond_1

    .line 230
    const-string v0, "ext_reason"

    invoke-virtual {p0, v0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 231
    :cond_1
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 232
    const-string v0, "ext_reason_msg"

    invoke-virtual {p0, v0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 233
    :cond_2
    const-string p5, "ext_chid"

    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    invoke-virtual {p0, p5, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 234
    sget-object p5, Lcom/xiaomi/push/service/an;->s:Ljava/lang/String;

    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->b:Ljava/lang/String;

    invoke-virtual {p0, p5, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 235
    sget-object p5, Lcom/xiaomi/push/service/an;->J:Ljava/lang/String;

    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->i:Ljava/lang/String;

    invoke-virtual {p0, p5, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 236
    iget-object p5, p2, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    iget-object v0, p2, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    .line 237
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    .line 238
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    filled-new-array {p5, v0, p3, p4}, [Ljava/lang/Object;

    move-result-object p3

    .line 239
    const-string p4, "[Bcst] notify channel open result. %s,%s,%b,%d"

    invoke-static {p4, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 240
    invoke-static {p1, p0, p2}, Lcom/xiaomi/push/service/h;->a(Landroid/content/Context;Landroid/content/Intent;Lcom/xiaomi/push/service/am$b;)V

    return-void
.end method

.method public a(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;Ll/g2r0;)V
    .locals 4

    .line 258
    invoke-virtual {p0, p3}, Lcom/xiaomi/push/service/h;->a(Ll/g2r0;)Lcom/xiaomi/push/service/am$b;

    move-result-object v0

    if-nez v0, :cond_0

    .line 259
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "error while notify channel closed! channel "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " not registered"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    return-void

    .line 260
    :cond_0
    const-string v1, "5"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 261
    iget-object p0, p0, Lcom/xiaomi/push/service/h;->a:Lcom/xiaomi/push/service/u;

    invoke-virtual {p0, p1, p3, v0}, Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/service/XMPushService;Ll/g2r0;Lcom/xiaomi/push/service/am$b;)V

    return-void

    .line 262
    :cond_1
    iget-object p0, v0, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    .line 263
    instance-of v1, p3, Ll/f2r0;

    if-eqz v1, :cond_2

    .line 264
    const-string v1, "com.xiaomi.push.new_msg"

    goto :goto_0

    .line 265
    :cond_2
    instance-of v1, p3, Lcom/xiaomi/push/j;

    if-eqz v1, :cond_3

    .line 266
    const-string v1, "com.xiaomi.push.new_iq"

    goto :goto_0

    .line 267
    :cond_3
    instance-of v1, p3, Lcom/xiaomi/push/fq;

    if-eqz v1, :cond_5

    .line 268
    const-string v1, "com.xiaomi.push.new_pres"

    .line 269
    :goto_0
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 270
    invoke-virtual {v2, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 271
    invoke-virtual {v2, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 272
    const-string p0, "ext_chid"

    invoke-virtual {v2, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 273
    const-string p0, "ext_packet"

    invoke-virtual {p3}, Ll/g2r0;->a()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v2, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 274
    sget-object p0, Lcom/xiaomi/push/service/an;->J:Ljava/lang/String;

    iget-object v1, v0, Lcom/xiaomi/push/service/am$b;->i:Ljava/lang/String;

    invoke-virtual {v2, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 275
    sget-object p0, Lcom/xiaomi/push/service/an;->B:Ljava/lang/String;

    iget-object v1, v0, Lcom/xiaomi/push/service/am$b;->h:Ljava/lang/String;

    invoke-virtual {v2, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 276
    iget-object p0, v0, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    iget-object v1, v0, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    .line 277
    invoke-virtual {p3}, Ll/g2r0;->l()Ljava/lang/String;

    move-result-object v3

    filled-new-array {p0, v1, v3}, [Ljava/lang/Object;

    move-result-object p0

    .line 278
    const-string v1, "[Bcst] notify packet arrival. %s,%s,%s"

    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 279
    const-string p0, "3"

    invoke-virtual {p0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4

    .line 280
    sget-object p0, Lcom/xiaomi/push/service/an;->w:Ljava/lang/String;

    iget-wide p2, p3, Ll/g2r0;->j:J

    invoke-virtual {v2, p0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 281
    sget-object p0, Lcom/xiaomi/push/service/an;->x:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    invoke-virtual {v2, p0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 282
    :cond_4
    invoke-static {p1, v2, v0}, Lcom/xiaomi/push/service/h;->a(Landroid/content/Context;Landroid/content/Intent;Lcom/xiaomi/push/service/am$b;)V

    return-void

    .line 283
    :cond_5
    const-string p0, "unknown packet type, drop it"

    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    return-void
.end method

.method public a(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;Ll/w0r0;)V
    .locals 6

    .line 1
    const-string v0, "message was sent by messenger for chid="

    .line 2
    .line 3
    invoke-virtual {p0, p3}, Lcom/xiaomi/push/service/h;->a(Ll/w0r0;)Lcom/xiaomi/push/service/am$b;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string p1, "error while notify channel closed! channel "

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p1, " not registered"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const-string v2, "5"

    .line 33
    .line 34
    invoke-virtual {v2, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Lcom/xiaomi/push/service/h;->a:Lcom/xiaomi/push/service/u;

    .line 41
    .line 42
    invoke-virtual {p0, p1, p3, v1}, Lcom/xiaomi/push/service/u;->a(Lcom/xiaomi/push/service/XMPushService;Ll/w0r0;Lcom/xiaomi/push/service/am$b;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-object p0, v1, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    .line 47
    .line 48
    new-instance v2, Landroid/content/Intent;

    .line 49
    .line 50
    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v3, "com.xiaomi.push.new_msg"

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    const-string v3, "ext_rcv_timestamp"

    .line 62
    .line 63
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 64
    .line 65
    .line 66
    move-result-wide v4

    .line 67
    invoke-virtual {v2, v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 68
    .line 69
    .line 70
    const-string v3, "ext_chid"

    .line 71
    .line 72
    invoke-virtual {v2, v3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    iget-object v3, v1, Lcom/xiaomi/push/service/am$b;->h:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p3, v3}, Ll/w0r0;->q(Ljava/lang/String;)[B

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    const-string v4, "ext_raw_packet"

    .line 82
    .line 83
    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    sget-object v3, Lcom/xiaomi/push/service/an;->J:Ljava/lang/String;

    .line 87
    .line 88
    iget-object v4, v1, Lcom/xiaomi/push/service/am$b;->i:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 91
    .line 92
    .line 93
    sget-object v3, Lcom/xiaomi/push/service/an;->B:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v4, v1, Lcom/xiaomi/push/service/am$b;->h:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    .line 99
    .line 100
    invoke-static {p3}, Lcom/xiaomi/push/service/e;->a(Ll/w0r0;)Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-eqz v3, :cond_2

    .line 105
    .line 106
    const-string v3, "ext_downward_pkt_id"

    .line 107
    .line 108
    invoke-virtual {p3}, Ll/w0r0;->D()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 113
    .line 114
    .line 115
    :cond_2
    iget-object v3, v1, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/Messenger;

    .line 116
    .line 117
    if-eqz v3, :cond_3

    .line 118
    .line 119
    const/16 v3, 0x11

    .line 120
    .line 121
    const/4 v4, 0x0

    .line 122
    invoke-static {v4, v3, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    :try_start_0
    iget-object v5, v1, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/Messenger;

    .line 127
    .line 128
    invoke-virtual {v5, v3}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    .line 129
    .line 130
    .line 131
    new-instance v3, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    invoke-static {p2}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :catch_0
    iput-object v4, v1, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/Messenger;

    .line 148
    .line 149
    iget-object p2, v1, Lcom/xiaomi/push/service/am$b;->b:Ljava/lang/String;

    .line 150
    .line 151
    const/16 v0, 0x40

    .line 152
    .line 153
    invoke-virtual {p2, v0}, Ljava/lang/String;->lastIndexOf(I)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    invoke-virtual {p2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    const-string v0, "peer may died: "

    .line 162
    .line 163
    invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    invoke-static {p2}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    :cond_3
    const-string p2, "com.xiaomi.xmsf"

    .line 171
    .line 172
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    if-nez p0, :cond_5

    .line 177
    .line 178
    iget-object p0, v1, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    .line 179
    .line 180
    iget-object p2, v1, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    .line 181
    .line 182
    invoke-virtual {p3}, Ll/w0r0;->D()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    filled-new-array {p0, p2, v0}, [Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    const-string p2, "[Bcst] notify packet(blob) arrival. %s,%s,%s"

    .line 191
    .line 192
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    invoke-static {p3}, Lcom/xiaomi/push/service/e;->a(Ll/w0r0;)Z

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    if-eqz p0, :cond_4

    .line 204
    .line 205
    invoke-static {}, Lcom/xiaomi/push/service/at;->a()Lcom/xiaomi/push/service/at;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-virtual {p3}, Ll/w0r0;->D()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p2

    .line 213
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 214
    .line 215
    .line 216
    move-result-wide v3

    .line 217
    invoke-virtual {p0, p2, v3, v4}, Lcom/xiaomi/push/service/at;->a(Ljava/lang/String;J)V

    .line 218
    .line 219
    .line 220
    :cond_4
    invoke-static {p1, v2, v1}, Lcom/xiaomi/push/service/h;->a(Landroid/content/Context;Landroid/content/Intent;Lcom/xiaomi/push/service/am$b;)V

    .line 221
    .line 222
    .line 223
    :cond_5
    return-void
.end method

.class public final Lv7h;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final c:Lwo;

.field public final synthetic d:Lw7h;


# direct methods
.method public constructor <init>(Lw7h;Lwo;)V
    .registers 3

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lv7h;->d:Lw7h;

    invoke-direct {p0, p1}, Ln1;-><init>(Lw7h;)V

    iput-object p2, p0, Lv7h;->c:Lwo;

    return-void
.end method


# virtual methods
.method public final V(Lcz;)Ldz;
    .registers 12

    new-instance v0, Liu9;

    iget-object v1, p0, Lv7h;->d:Lw7h;

    move-object v2, v1

    iget-object v1, v2, Lw7h;->a:Landroid/app/Activity;

    move-object v3, v2

    iget-object v2, v3, Lw7h;->d:Lcom/opera/android/Lazy;

    move-object v4, v3

    iget-object v3, v4, Lw7h;->f:Lpyl;

    move-object v5, v4

    iget-object v4, v5, Lw7h;->m:Li5o;

    move-object v6, v5

    iget-object v5, v6, Lw7h;->j:Luwh;

    invoke-virtual {v6, p1}, Lw7h;->b(Lcz;)Lr68;

    move-result-object v7

    iget-object v8, v6, Lw7h;->n:Li3j;

    iget-object v9, v6, Lw7h;->s:Lr9g;

    iget-object v6, p0, Lv7h;->c:Lwo;

    invoke-direct/range {v0 .. v9}, Liu9;-><init>(Landroid/app/Activity;Lcom/opera/android/Lazy;Lpyl;Li5o;Luwh;Lwo;Lr68;Li3j;Lr9g;)V

    return-object v0
.end method

.method public final W()Lcz;
    .registers 5

    new-instance v0, Lcz;

    iget-object p0, p0, Lv7h;->c:Lwo;

    iget-object v1, p0, Lvo;->d:Lyo;

    sget-object v2, Lrm;->b:Lrm;

    iget-object v3, p0, Lwo;->i:Ljava/lang/String;

    iget-object p0, p0, Lwo;->h:Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, v1, v2, p0}, Lcz;-><init>(Lyo;Lrm;Ljava/lang/String;)V

    return-object v0
.end method

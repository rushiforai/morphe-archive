.class public final Llkj;
.super Ljkj;
.source "SourceFile"

# interfaces
.implements Lpl3;


# instance fields
.field public final d:Lshf;


# direct methods
.method public constructor <init>(JLjava/lang/String;Lshf;)V
    .registers 6

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Ljkj;-><init>(JZLjava/lang/String;)V

    iput-object p4, p0, Llkj;->d:Lshf;

    return-void
.end method

.method public static k(JLjava/lang/String;Ljava/lang/String;)Llkj;
    .registers 7

    new-instance v0, Llkj;

    new-instance v1, Lshf;

    invoke-static {p3}, Lwqm;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const/16 v2, 0xd

    invoke-direct {v1, p3, v2}, Lshf;-><init>(Ljava/lang/String;B)V

    invoke-direct {v0, p0, p1, p2, v1}, Llkj;-><init>(JLjava/lang/String;Lshf;)V

    return-object v0
.end method


# virtual methods
.method public final b()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final d()J
    .registers 3

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public final f()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Llkj;->d:Lshf;

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final getUrl()Lshf;
    .registers 1

    iget-object p0, p0, Llkj;->d:Lshf;

    return-object p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    invoke-super {p0, p1, p2}, Ljkj;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object p0, p0, Llkj;->d:Lshf;

    iget-object p0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method

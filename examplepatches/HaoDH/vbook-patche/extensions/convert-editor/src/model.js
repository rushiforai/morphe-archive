function execute() {
    return Response.success([
        {id:'deepseek-flash',name:'DeepSeek Flash',description:'Nhanh, mặc định; không suy luận dài.',isNetworkRequired:true},
        {id:'deepseek-v4-pro',name:'DeepSeek V4 Pro',description:'Ưu tiên chất lượng; chi phí cao hơn Flash.',isNetworkRequired:true}
    ]);
}
